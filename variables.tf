variable "tags" {
  description = "Map of tags that will be applied on all resources."
  type        = map(string)
  default     = {}
}

variable "prefix" {
  description = "Prefix to be added to with all resource's names of the module. Prefix is mainly used for tests and should remain empty in normal circumstances."
  default     = ""

  validation {
    condition     = can(regex("^[a-z0-9-]{0,16}$", var.prefix))
    error_message = "The var.prefix should match “^[a-z0-9-]{0,16}$”."
  }
}

#####
# Batch
#####

variable "compute_environment_create" {
  description = "Whether or not to create a compute environment for Batch"
  type        = bool
  default     = true
}

variable "compute_environment_name" {
  description = "(Optional, Forces new resource) The name for your compute environment. Up to 128 letters (uppercase and lowercase), numbers, hyphens and underscores are allowed. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null

  validation {
    condition     = var.compute_environment_name == null || can(regex("^[a-zA-Z0-9_-]{0,128}$", var.compute_environment_name))
    error_message = "The var.compute_environment_name should match “^[a-zA-Z0-9_-]{0,128}$”."
  }
}

variable "compute_environment_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique compute environment name beginning with the specified prefix. Conflicts with compute_environment_name."
  type        = string
  default     = null

  validation {
    condition     = var.compute_environment_name_prefix == null || can(regex("^[0-9a-zA-Z]{1}[0-9a-zA-Z_-]{0,101}$", var.compute_environment_name_prefix))
    error_message = "The var.compute_environment_name_prefix should match “^[0-9a-zA-Z]{1}[0-9a-zA-Z_-]{0,101}$”."
  }
}

variable "compute_environment_managed" {
  description = "Whether or not to manage the compute environment (toggles compute_environment.type MANAGED/UNMANAGED)."
  type        = bool
  default     = true
}

variable "compute_environment_enabled" {
  description = "Whether or not to enable the compute environment (toggles compute_environment.state ENABLED/DISABLED.)."
  type        = bool
  default     = true
}

variable "compute_environment_tags" {
  description = "Key-value map of resource tags for the compute environment (merged with `var.tags`)"
  type        = map(string)
  default     = {}
}

variable "compute_environment_arns" {
  description = "(Needed if compute_environment_create == false) Specifies the set of compute environments (ARNs) mapped to a job queue and their order. The position of the compute environments in the list will dictate the order. You can associate up to 3 compute environments with a job queue"
  type        = list(string)
  default     = []

  validation {
    condition     = can([for s in var.compute_environment_arns : regex("^arn:aws[a-zA-Z0-9-]*:batch:[a-zA-Z0-9-]*:[0-9]{12}:compute-environment/[a-zA-Z0-9_-]*$", s)])
    error_message = "Each entries of var.compute_environment_arns should match ^arn:aws[a-zA-Z0-9-]*:batch:[a-zA-Z0-9-]*:[0-9]{12}:compute-environment/[a-zA-Z0-9_-]*$."
  }
}

variable "compute_resource_instance_type" {
  description = "The instances types that can be launched. You can specify instance families to launch any instance type within those families (for example, c5 or p3), or you can specify specific sizes within a family (such as c5.8xlarge). You can also choose optimal to select instance types (from the C4, M4, and R4 instance families) that match the demand of your job queues."
  type        = list(string)
  default     = ["c5.large"]

  validation {
    condition     = can([for s in var.compute_resource_instance_type : regex("^(([[:lower:]]+\\d[[:lower:]]*(\\.[a-z0-9]+)?)|optimal)$", s)])
    error_message = "Each entries of var.compute_resource_instance_type should match ^(([[:lower:]]+\\d[[:lower:]]*(\\.[a-z0-9]+)?)|optimal)$."
  }
}

variable "compute_resource_min_vcpus" {
  description = "The minimum number of EC2 vCPUs that an environment should maintain."
  type        = number
  default     = 0

  validation {
    condition     = var.compute_resource_min_vcpus >= 0
    error_message = "The var.compute_resource_min_vcpus should be positive."
  }
}

variable "compute_resource_max_vcpus" {
  description = "The maximum number of EC2 vCPUs that an environment can reach."
  type        = number
  default     = 16

  validation {
    condition     = var.compute_resource_max_vcpus >= 0
    error_message = "The var.compute_resource_max_vcpus should be positive."
  }
}

variable "compute_resource_type" {
  description = "The type of compute environment. Valid items are EC2 or SPOT."
  type        = string
  default     = "EC2"

  validation {
    condition     = contains(["EC2", "SPOT"], var.compute_resource_type)
    error_message = "The var.compute_resource_type value must be EC2 or SPOT."
  }
}

variable "compute_resource_image_id" {
  description = "The Amazon Machine Image (AMI) ID used for instances launched in the compute environment"
  type        = string
  default     = null

  validation {
    condition     = var.compute_resource_image_id == null || can(regex("^ami-([a-z0-9]{8}|[a-z0-9]{17})$", var.compute_resource_image_id))
    error_message = "The var.compute_resource_image_id should match ^subnet-([a-z0-9]{8}|[a-z0-9]{17})$."
  }
}

variable "compute_resource_subnet_ids" {
  description = "A list of VPC subnets into which the compute resources are launched"
  type        = list(string)

  validation {
    condition     = 0 < length(var.compute_resource_subnet_ids) && can([for s in var.compute_resource_subnet_ids : regex("^subnet-([a-z0-9]{8}|[a-z0-9]{17})$", s)])
    error_message = "The var.compute_resource_subnet_ids should contains at least one subnet id and each entry should match ^subnet-([a-z0-9]{8}|[a-z0-9]{17})$."
  }
}

variable "compute_resource_ec2_key_pair" {
  description = "The EC2 key pair that is used for instances launched in the compute environment."
  type        = string
  default     = null

  validation {
    condition     = var.compute_resource_ec2_key_pair == null || can(regex("^[[:ascii:]]{1,255}$", var.compute_resource_ec2_key_pair))
    error_message = "The var.compute_resource_ec2_key_pair should match ^[[:ascii:]]{1,255}$."
  }
}

variable "compute_resource_allocation_strategy" {
  description = "The allocation strategy to use for the compute resource in case not enough instances of the best fitting instance type can be allocated. Valid items are BEST_FIT_PROGRESSIVE, SPOT_CAPACITY_OPTIMIZED or BEST_FIT."
  type        = string
  default     = "BEST_FIT_PROGRESSIVE"

  validation {
    condition     = contains(["BEST_FIT", "BEST_FIT_PROGRESSIVE", "SPOT_CAPACITY_OPTIMIZED"], var.compute_resource_allocation_strategy)
    error_message = "The var.compute_resource_allocation_strategy must be BEST_FIT, BEST_FIT_PROGRESSIVE or SPOT_CAPACITY_OPTIMIZED."
  }
}

variable "compute_resource_bid_percentage" {
  description = "Integer of minimum percentage that a Spot Instance price must be when compared with the On-Demand price for that instance type before instances are launched. For example, if your bid percentage is 20% (20), then the Spot price must be below 20% of the current On-Demand price for that EC2 instance. This parameter is required for SPOT compute environments."
  type        = number
  default     = null

  validation {
    condition     = var.compute_resource_bid_percentage == null || try(var.compute_resource_bid_percentage >= 0 && var.compute_resource_bid_percentage <= 100, false)
    error_message = "If var.compute_resource_bid_percentage set, must be between 0 and 100."
  }
}

variable "compute_resource_spot_iam_fleet_role" {
  description = "(Needed for Spot if service_role_spot_create == false)The Amazon Resource Name (ARN) of the Amazon EC2 Spot Fleet IAM role applied to a SPOT compute environment. This parameter is required for SPOT compute environments."
  type        = string
  default     = null

  validation {
    condition     = var.compute_resource_spot_iam_fleet_role == null || can(regex("^arn:aws[a-zA-Z0-9-]*:iam::[0-9]{12}:role/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$", var.compute_resource_spot_iam_fleet_role))
    error_message = "The var.compute_resource_spot_iam_fleet_role should match ^arn:aws[a-zA-Z0-9-]*:iam::[0-9]{12}:role/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$."
  }
}

variable "compute_resource_launch_template" {
  description = "Launch template configuration for compute environment format: list(object({ launch_template_id = string, version = optional(number) }))"
  # When the feature "optional type attributes" (https://www.terraform.io/docs/language/expressions/type-constraints.html#experimental-optional-object-type-attributes)
  # will be fully released, we will be able to validate the type with:
  # type = list(object({
  #   launch_template_id   = string,
  #   version              = optional(number),
  # }))
  type = list(any)
  # Can not be null, because it's used in a for_each
  default = []

  validation {
    condition     = can(length(var.compute_resource_launch_template) <= 1)
    error_message = "The var.compute_resource_launch_template should not contains more than one entry."
  }
}

variable "compute_resource_desired_vcpus" {
  description = "The desired number of EC2 vCPUS in the compute environment."
  type        = number
  default     = null

  validation {
    condition     = var.compute_resource_desired_vcpus == null || try(var.compute_resource_desired_vcpus >= 0, false)
    error_message = "The var.compute_resource_desired_vcpus should be positive if not null."
  }
}

variable "compute_resource_tags" {
  description = "Tags to be used for compute resources (merged with `var.tags`)."
  type        = map(string)
  default     = {}
}

variable "queue_create" {
  description = "Whether or not to create a job queue for Batch"
  type        = bool
  default     = true
}

variable "queue_name" {
  description = "Specifies the name of the job queue."
  type        = string
  default     = "job-queue"

  validation {
    condition     = var.queue_name == null || can(regex("^[a-zA-Z0-9_-]{1,128}$", var.queue_name))
    error_message = "The var.queue_name must match “^[a-zA-Z0-9_-]{1,128}$”."
  }
}

variable "queue_enabled" {
  description = "Whether or not to enable job queue (toggles aws_batch_job_queue.state ENABLED/DISABLED).)"
  type        = bool
  default     = true
}

variable "queue_priority" {
  description = "The priority of the job queue. Job queues with a higher priority are evaluated first when associated with the same compute environment."
  type        = number
  default     = 1

  validation {
    condition     = var.queue_priority == null || try(var.queue_priority >= 0 && var.queue_priority <= 1000, false)
    error_message = "The var.queue_priority must be between 0 and 1000."
  }
}

variable "queue_tags" {
  description = "Tags to be used for the job queue (merged with `var.tags`)."
  type        = map(string)
  default     = {}
}

#####
# Instance Profile
#####

variable "ecs_instance_profile_create" {
  description = "Whether or not to create instance profile for ECS instances"
  type        = bool
  default     = true
}

variable "ecs_instance_profile_arn" {
  description = "(Needed if service_role_create == false) The Amazon ECS instance role applied to Amazon EC2 instances in a compute environment."
  type        = string
  default     = null

  validation {
    condition     = var.ecs_instance_profile_arn == null || can(regex("^arn:aws[a-zA-Z0-9-]*:iam::[0-9]{12}:instance-profile/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$", var.ecs_instance_profile_arn))
    error_message = "The var.ecs_instance_profile_arn must match “^arn:aws[a-zA-Z0-9-]*:iam::[0-9]{12}:instance-profile/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$”."
  }
}

variable "ecs_instance_role_name" {
  description = "Name of the IAM Role to be used by the Instance Profile. If null, Terraform will assign a random, unique name. Ignored if `var.ecs_instance_profile_create` is `false`."
  type        = string
  default     = "BatchEcsInstanceRole"

  validation {
    condition     = var.ecs_instance_role_name == null || can(regex("^[_+=,\\.@a-zA-Z0-9-]{1,128}$", var.ecs_instance_role_name))
    error_message = "The var.ecs_instance_role_name must match “^[_+=,\\.@a-zA-Z0-9-]{1,128}$”."
  }
}

variable "ecs_instance_role_description" {
  description = "Description of the IAM Role to be used by the Instance Profile. Ignored if `var.ecs_instance_profile_create` is `false`."
  type        = string
  default     = "Instance Profile Role For Batch Instances"

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\+=,\\.@_ -]{0,1000}$", var.ecs_instance_role_description))
    error_message = "The var.ecs_instance_role_description must match “^[a-zA-Z0-9\\+=,\\.@_ -]{0,1000}$”."
  }
}

variable "ecs_instance_role_path" {
  description = "Path in which to create the Instance Profile for the EC2 instance (or launch template). Instance Profile IAM Role will share the same path. Ignored if `var.ecs_instance_profile_create` is `false`."
  default     = null

  validation {
    condition     = var.ecs_instance_role_path != null ? can(regex("^(\\x2F$)|(\\x2F[\\x21-\\x7F]+\\x2F)*$", var.ecs_instance_role_path)) : true
    error_message = "The var.ecs_instance_role_path must match “^(\\x2F$)|(\\x2F[\\x21-\\x7F]+\\x2F)*$”."
  }
}

variable "ecs_instance_role_tags" {
  description = "Tags to be used for the Instance Profile Role (merged with `var.tags`)."
  type        = map(string)
  default     = {}
}

variable "ecs_instance_profile_name" {
  description = "The IAM profile's name for the EC2 instance (or launch template). If `var.ecs_instance_profile_create` is `true` and this is null, Terraform will assign a random, unique name. If `var.ecs_instance_profile_create` is `false` this value should be the name of an external IAM Instance Profile."
  type        = string
  default     = "BatchEcsInstanceRole"

  validation {
    condition     = var.ecs_instance_profile_name == null || can(regex("^[\\w+=,.@-]{1,128}$", var.ecs_instance_profile_name))
    error_message = "The var.ecs_instance_profile_name must match “^[\\w+=,.@-]{1,128}$”."
  }
}

variable "ecs_instance_profile_path" {
  description = "Path in which to create the Instance Profile for the EC2 instance (or launch template). Instance Profile IAM Role will share the same path. Ignored if `var.ecs_instance_profile_create` is `false`."
  type        = string
  default     = null

  validation {
    condition     = var.ecs_instance_profile_path != null ? can(regex("^(\\x2F$)|(\\x2F[\\x21-\\x7F]+\\x2F)*$", var.ecs_instance_profile_path)) : true
    error_message = "The var.ecs_instance_profile_path must match “^(\\x2F$)|(\\x2F[\\x21-\\x7F]+\\x2F)*$”."
  }
}

#####
# Service Role EC2
#####

variable "service_role_create" {
  description = "Whether or not to create service role for Batch"
  type        = bool
  default     = true
}

variable "service_role_name" {
  description = "Instance role name for ECS instances"
  type        = string
  default     = "BatchServiceRoleEC2"

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\+=,\\.@_-]{1,64}$", var.service_role_name))
    error_message = "The var.service_role_name mus match ^[a-zA-Z0-9\\+=,\\.@_-$]{1,64}."
  }
}

variable "service_role_description" {
  description = "Description of the IAM Role to be used by the Batch. Ignored if `var.service_role_create` is `false`."
  type        = string
  default     = "Service Role For Batch"

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\+=,\\.@_ -]{0,1000}$", var.service_role_description))
    error_message = "The var.service_role_description must match “^[a-zA-Z0-9\\+=,\\.@_ -]{0,1000}$”."
  }
}

variable "service_role_path" {
  description = "Path in which to create the service role for Batch. Ignored if `var.service_role_create` is `false`."
  type        = string
  default     = null

  validation {
    condition     = var.service_role_path != null ? can(regex("^(\\x2F$)|(\\x2F[\\x21-\\x7F]+\\x2F)*$", var.service_role_path)) : true
    error_message = "The var.service_role_path must match “^(\\x2F$)|(\\x2F[\\x21-\\x7F]+\\x2F)*$”."
  }
}

variable "service_role_arn" {
  description = "(Needed if service_role_create == false) Full Amazon Resource Name (ARN) of the IAM role that allows AWS Batch to make calls to other AWS services on your behalf."
  type        = string
  default     = null

  validation {
    condition     = var.service_role_arn == null || can(regex("^arn:aws[a-zA-Z0-9-]*:iam::[0-9]{12}:role/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$", var.service_role_arn))
    error_message = "The var.service_role_arn should match ^arn:aws:iam[a-zA-Z0-9-]*::[0-9]{12}:role/[a-zA-Z0-9\\+=,\\.@_-]{1,64}$."
  }
}

#####
# Service Role Spot
#####

variable "service_role_spot_create" {
  description = "Whether or not to create service role for Spot"
  type        = bool
  default     = true
}

variable "service_role_spot_name" {
  description = "Instance role name for ECS instances"
  type        = string
  default     = "AmazonEC2SpotFleetTaggingRole"
}

variable "service_role_spot_description" {
  description = "Description of the IAM Role to be used by the Batch. Ignored if `var.service_role_spot_create` is `false`."
  type        = string
  default     = "Service Role Spot For Batch"

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\+=,\\.@_ -]{0,1000}$", var.service_role_spot_description))
    error_message = "The var.service_role_spot_description must match “^[a-zA-Z0-9\\+=,\\.@_ -]{0,1000}$”."
  }
}

variable "service_role_spot_path" {
  description = "Path in which to create the service role for Batch. Ignored if `var.service_role_spot_create` is `false`."
  type        = string
  default     = null

  validation {
    condition     = var.service_role_spot_path != null ? can(regex("^(\\x2F$)|(\\x2F[\\x21-\\x7F]+\\x2F)*$", var.service_role_spot_path)) : true
    error_message = "The var.service_role_spot_path must match “^(\\x2F$)|(\\x2F[\\x21-\\x7F]+\\x2F)*$”."
  }
}

variable "service_linked_role_spot_create" {
  description = "Whether or not to create service role for Spot"
  type        = bool
  default     = true
}

variable "service_linked_role_spotfleet_create" {
  description = "Whether or not to create service role for Spot"
  type        = bool
  default     = true
}

variable "service_linked_role_spot_description" {
  description = "Description attached to the service linked role"
  type        = string
  default     = "Spot service linked role"

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\+=,\\.@_ -]{0,1000}$", var.service_linked_role_spot_description))
    error_message = "The var.service_role_spot_description must match “^[a-zA-Z0-9\\+=,\\.@_ -]{0,1000}$”."
  }
}

variable "service_linked_role_spotfleet_description" {
  description = "Description attached to the service linked role"
  type        = string
  default     = "Spotfleet service linked role"

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\+=,\\.@_ -]{0,1000}$", var.service_linked_role_spotfleet_description))
    error_message = "The var.service_role_spot_description must match “^[a-zA-Z0-9\\+=,\\.@_ -]{0,1000}$”."
  }

}

#####
# Additional Service role policy
#####

variable "additional_iam_policy_arns" {
  description = "add additional policy arns to service role"
  type        = list(string)
  default     = [""]
}

# Security Group
#####

variable "instance_sg_create" {
  description = "Whether or not to create Security Group for Batch instances"
  type        = bool
  default     = true
}

variable "instance_sg_name" {
  description = "SG name for Batch instances"
  type        = string
  default     = "SG for Batch instances"

  validation {
    condition     = can(regex("^[a-zA-Z0-9 \\._:\\/\\(\\)\\#,\\[\\]\\+=&;{}!\\$\\*-]{1,255}$", var.instance_sg_name))
    error_message = "The var.instance_sg_name should match “^[a-zA-Z0-9 \\._:\\/\\(\\)\\#,\\[\\]\\+=&;{}!\\$\\*-]{1,255}$”."
  }
}

variable "instance_sg_tags" {
  description = "Tags to be used for the instances SG (merged with `var.tags`)."
  type        = map(string)
  default     = {}
}

variable "instance_sg_ids" {
  description = "(Needed if instance_sg_create == false) A list of EC2 security group that are associated with instances launched in the compute environment"
  type        = list(string)
  default     = []

  validation {
    condition     = can([for s in var.instance_sg_ids : regex("^sg-([a-z0-9]{8}|[a-z0-9]{17})$", s)])
    error_message = "Every element of var.instance_sg_ids must match “^sg-([a-z0-9]{8}|[a-z0-9]{17})$”."
  }
}
