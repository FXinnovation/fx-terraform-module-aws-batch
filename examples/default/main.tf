resource "random_string" "default" {
  length  = 8
  special = false
  upper   = false
  number  = false
}

resource "random_string" "extraenvspot" {
  length  = 8
  special = false
  upper   = false
  number  = false
}

resource "random_string" "extrajqueue" {
  length  = 8
  special = false
  upper   = false
  number  = false
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}

resource "aws_key_pair" "this" {
  key_name_prefix = "tft${random_string.default.result}"
  public_key      = tls_private_key.this.public_key_openssh
}

resource "aws_launch_template" "this" {
  name_prefix   = "tftlc"
  instance_type = "c5.large"
  image_id      = data.aws_ami.amazon-linux-2-ami.id
}

locals {
  tags = {
    Env = "Test"
  }
}

module "default" {
  source = "../../"

  prefix = format("tft%s", random_string.default.result)

  compute_resource_subnet_ids   = data.aws_subnet_ids.this.ids
  compute_resource_ec2_key_pair = aws_key_pair.this.key_name
  compute_resource_launch_template = [{
    launch_template_id      = aws_launch_template.this.id,
    launch_template_version = aws_launch_template.this.latest_version,
  }]
  service_linked_role_spot_create      = false
  service_linked_role_spotfleet_create = false
  tags                                 = local.tags
}

# In addition to the EC2 compute environment from standard module, add an extra spot compute env
module "extraenvspot" {
  source = "../../"

  prefix = format("tft%s", random_string.extraenvspot.result)

  compute_resource_subnet_ids = data.aws_subnet_ids.this.ids

  compute_resource_type           = "SPOT"
  compute_resource_bid_percentage = 0

  service_role_spot_create             = false
  compute_resource_spot_iam_fleet_role = module.default.iam_role_service_role_spot_arn
  compute_resource_image_id            = data.aws_ami.amazon-linux-2-ami.id
  ecs_instance_profile_create          = false
  ecs_instance_profile_arn             = module.default.iam_instance_profile_ecs_instance_role_arn
  service_role_create                  = false
  service_role_arn                     = module.default.iam_role_service_role_arn
  instance_sg_create                   = false
  instance_sg_ids                      = [module.default.security_group_instances_id]
  service_linked_role_spot_create      = false
  service_linked_role_spotfleet_create = false
  tags                                 = local.tags
}

# In addition to the job_queue created by extraenvspot module, add a new one with this 2 compute environents
module "extrajqueue" {
  source = "../../"

  prefix = format("tft%s", random_string.extrajqueue.result)

  compute_resource_subnet_ids = data.aws_subnet_ids.this.ids

  compute_environment_create = false
  compute_environment_arns = [
    module.default.batch_compute_environment_arn,
    module.extraenvspot.batch_compute_environment_arn,
  ]
  service_role_spot_create             = false
  compute_resource_spot_iam_fleet_role = module.default.iam_role_service_role_spot_arn
  ecs_instance_profile_create          = false
  ecs_instance_profile_arn             = module.default.iam_instance_profile_ecs_instance_role_arn
  service_role_create                  = false
  service_role_arn                     = module.default.iam_role_service_role_arn
  instance_sg_create                   = false
  instance_sg_ids                      = [module.default.security_group_instances_id]
  service_linked_role_spot_create      = false
  service_linked_role_spotfleet_create = false
  tags                                 = local.tags
}