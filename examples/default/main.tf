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

resource "aws_key_pair" "this" {
  key_name   = "tft${random_string.default.result}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDd9y7Vs3trccT98Z/zW42SxLmSTlO2dsOgOg+bJB4JD6jfFagwHMd2VeD6idVB0FML52GePo537+SCn9Lhhy4tnJMc7Kx/5WKacvaRPFK8AYvl2JQ6RHQtXnxLwZNAeB2LRi15NTvh3f9jx/o0MKXKWyFdK5MEixzbFiBtipOiO138AIk3d4YTFdQHDjN2DDk0WN2+aMUM27LXHgypdWMZvtKlyOpIR7Kydx7QghXiVj7d/9q9KOKjZFDjVbfSAC27oJ8c1MIHJc7jLCkNhrmg0KJi9oVehfcD5xVG9LL7vLJ/ifMgFgVRM04XgKGYcin0tXTA2jjBAkZL/qwYkcQt0pMc8VC/e4/QL8oKY0VDBzWH2v423o5tu+EWjVozVd6ekoyG9/1njhxZQ6wA097R/ICEs/jOWGU4+N/YkAqECpeDFi3MMYs1ZaU71UbAddcnAR6xNiNnH56fu42dzSVgQDtYuZAhh86o6zp9F0IDGfLkRHE5M/RMgQgsDF38ls8= email@example.com"
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
  compute_resource_spot_iam_fleet_role = module.default.aws_iam_role_service_role_spot_arn
  compute_resource_image_id            = data.aws_ami.amazon-linux-2-ami.id
  ecs_instance_profile_create          = false
  ecs_instance_profile_arn             = module.default.aws_iam_instance_profile_ecs_instance_role_arn
  service_role_create                  = false
  service_role_arn                     = module.default.aws_iam_role_service_role_arn
  instance_sg_create                   = false
  instance_sg_ids                      = [module.default.aws_security_group_instances_id]
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
    module.default.aws_batch_compute_environment_arn,
    module.extraenvspot.aws_batch_compute_environment_arn,
  ]
  service_role_spot_create             = false
  compute_resource_spot_iam_fleet_role = module.default.aws_iam_role_service_role_spot_arn
  ecs_instance_profile_create          = false
  ecs_instance_profile_arn             = module.default.aws_iam_instance_profile_ecs_instance_role_arn
  service_role_create                  = false
  service_role_arn                     = module.default.aws_iam_role_service_role_arn
  instance_sg_create                   = false
  instance_sg_ids                      = [module.default.aws_security_group_instances_id]
  service_linked_role_spot_create      = false
  service_linked_role_spotfleet_create = false
  tags                                 = local.tags
}
