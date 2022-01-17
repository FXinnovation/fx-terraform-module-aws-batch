locals {
  compute_resource_type_is_fargate = contains(["FARGATE", "FARGATE_SPOT"], var.compute_resource_type)
  tags = {
    managed-by = "Terraform"
  }
}


#####
# Batch
#####

resource "aws_batch_compute_environment" "this" {
  count = var.compute_environment_create ? 1 : 0

  compute_environment_name        = var.compute_environment_name != null ? format("%s%s", var.prefix, var.compute_environment_name) : null
  compute_environment_name_prefix = var.compute_environment_name_prefix != null ? format("%s%s", var.prefix, var.compute_environment_name_prefix) : null

  compute_resources {
    instance_role = local.compute_resource_type_is_fargate == false ? (
      var.ecs_instance_profile_create ? aws_iam_instance_profile.ecs_instance_role.0.arn : var.ecs_instance_profile_arn
    ) : null

    instance_type = var.compute_resource_instance_type
    min_vcpus     = local.compute_resource_type_is_fargate == false ? var.compute_resource_min_vcpus : null
    desired_vcpus = local.compute_resource_type_is_fargate == false ? var.compute_resource_desired_vcpus : null
    max_vcpus     = var.compute_resource_max_vcpus

    subnets = var.compute_resource_subnet_ids

    security_group_ids = concat(
      var.instance_sg_create ? [aws_security_group.instances.0.id] : [],
      var.instance_sg_ids,
    )

    type                = var.compute_resource_type
    allocation_strategy = var.compute_resource_allocation_strategy
    bid_percentage      = var.compute_resource_bid_percentage
    ec2_key_pair        = var.compute_resource_ec2_key_pair
    image_id            = var.compute_resource_image_id

    dynamic "launch_template" {
      for_each = var.compute_resource_launch_template
      content {
        launch_template_id = launch_template.value.launch_template_id
        version            = try(launch_template.value.version, null)
      }
    }

    # only needed for BEST_FIT (default)
    spot_iam_fleet_role = (local.compute_resource_type_is_fargate == false && (var.compute_resource_allocation_strategy == "BEST_FIT" || var.compute_resource_allocation_strategy == null)) ? (
      var.compute_resource_spot_iam_fleet_role != null ? var.compute_resource_spot_iam_fleet_role : (var.service_role_spot_create ? aws_iam_role.service_role_spot.0.arn : null)
    ) : null

    tags = local.compute_resource_type_is_fargate == false ? merge(
      local.tags,
      var.tags,
      var.compute_resource_tags,
    ) : null
  }

  type  = var.compute_environment_managed ? "MANAGED" : "UNMANAGED"
  state = var.compute_environment_enabled ? "ENABLED" : "DISABLED"

  service_role = var.service_role_arn != null ? var.service_role_arn : aws_iam_role.service_role.0.arn

  depends_on = [
    aws_iam_role_policy_attachment.service_role,
    aws_iam_role_policy_attachment.service_role_spot,
  ]

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    local.tags,
    var.tags,
    var.compute_environment_tags,
  )
}

resource "aws_batch_job_queue" "this" {
  count = var.queue_create ? 1 : 0

  name     = format("%s%s", var.prefix, var.queue_name)
  state    = var.queue_enabled ? "ENABLED" : "DISABLED"
  priority = var.queue_priority

  compute_environments = concat(
    var.compute_environment_create ? [aws_batch_compute_environment.this.0.arn, ] : [],
    var.compute_environment_arns,
  )

  tags = merge(
    local.tags,
    var.tags,
    var.queue_tags,
  )
}


#####
# Instance Profile
#####

resource "aws_iam_role" "ecs_instance_role" {
  count = var.ecs_instance_profile_create ? 1 : 0

  name               = var.ecs_instance_role_name != null ? format("%s%s", var.prefix, var.ecs_instance_role_name) : null
  description        = var.ecs_instance_role_description
  path               = var.ecs_instance_role_path
  assume_role_policy = data.aws_iam_policy_document.sts_ec2.*.json[0]

  tags = merge(
    local.tags,
    var.tags,
    var.ecs_instance_role_tags,
  )
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role" {
  count = var.ecs_instance_profile_create ? 1 : 0

  role       = aws_iam_role.ecs_instance_role.0.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs_instance_role" {
  count = var.ecs_instance_profile_create ? 1 : 0

  name = var.ecs_instance_profile_name != null ? format("%s%s", var.prefix, var.ecs_instance_profile_name) : null
  path = var.ecs_instance_profile_path

  role = aws_iam_role.ecs_instance_role.0.id
}


resource "aws_iam_role_policy_attachment" "ecs_additional_policy" {
  count = var.ecs_instance_profile_create && length(var.ecs_instance_profile_additional_iam_policy_arns) > 0 ? length(var.ecs_instance_profile_additional_iam_policy_arns) : 0

  role       = element(concat(aws_iam_role.ecs_instance_role.*.name, [""]), 0)
  policy_arn = var.ecs_instance_profile_additional_iam_policy_arns[count.index]
}


#####
# Service Role EC2
#####

resource "aws_iam_role" "service_role" {
  count = var.service_role_create ? 1 : 0

  name               = format("%s%s", var.prefix, var.service_role_name)
  description        = var.service_role_description
  path               = var.service_role_path
  assume_role_policy = data.aws_iam_policy_document.sts_batch.*.json[0]
}

resource "aws_iam_role_policy_attachment" "service_role" {
  count = var.service_role_create ? 1 : 0

  role       = aws_iam_role.service_role.0.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}

resource "aws_iam_role_policy_attachment" "additional_policy" {
  count = var.service_role_create && var.attach_additional_policy ? length(var.additional_iam_policy_arns) : 0

  role       = aws_iam_role.service_role[count.index].name
  policy_arn = var.additional_iam_policy_arns[count.index]
}


#####
# Service Role Spot
#####

resource "aws_iam_role" "service_role_spot" {
  count = var.service_role_spot_create ? 1 : 0

  name               = format("%s%s", var.prefix, var.service_role_spot_name)
  description        = var.service_role_spot_description
  path               = var.service_role_spot_path
  assume_role_policy = data.aws_iam_policy_document.sts_spotfleet.*.json[0]
}

resource "aws_iam_role_policy_attachment" "service_role_spot" {
  count = var.service_role_spot_create ? 1 : 0

  role       = aws_iam_role.service_role_spot.0.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetTaggingRole"
}

resource "aws_iam_service_linked_role" "spot" {
  count = var.service_linked_role_spot_create ? 1 : 0

  aws_service_name = "spot.amazonaws.com"
  description      = var.service_linked_role_spot_description
}

resource "aws_iam_service_linked_role" "spotfleet" {
  count = var.service_linked_role_spotfleet_create ? 1 : 0

  aws_service_name = "spotfleet.amazonaws.com"
  description      = var.service_linked_role_spotfleet_description
}


#####
# Security Group
#####

resource "aws_security_group" "instances" {
  count = var.instance_sg_create ? 1 : 0

  name        = format("%s%s", var.prefix, var.instance_sg_name)
  description = "For AWS Batch instances"
  vpc_id      = data.aws_subnet.this.vpc_id

  tags = merge(
    local.tags,
    var.tags,
    var.instance_sg_tags,
  )
}

resource "aws_security_group_rule" "instances_egress_open" {
  count = var.instance_sg_create ? 1 : 0

  security_group_id = aws_security_group.instances.0.id
  description       = "Allow all egress for Batch instances"
  type              = "egress"
  protocol          = "-1"
  to_port           = 0
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"] #tfsec:ignore:AWS007
}
