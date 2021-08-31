#####
# Batch
#####

output "batch_compute_environment_arn" {
  description = "The Amazon Resource Name (ARN) of the compute environment."
  value       = concat(aws_batch_compute_environment.this.*.arn, [""])[0]
}

output "batch_compute_environment_ecs_cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the underlying Amazon ECS cluster used by the compute environment."
  value       = concat(aws_batch_compute_environment.this.*.ecs_cluster_arn, [""])[0]
}

output "batch_compute_environment_status" {
  description = "The current status of the compute environment (for example, CREATING or VALID)."
  value       = concat(aws_batch_compute_environment.this.*.status, [""])[0]
}

output "batch_compute_environment_status_reason" {
  description = "A short, human-readable string to provide additional details about the current status of the compute environment."
  value       = concat(aws_batch_compute_environment.this.*.status_reason, [""])[0]
}

output "batch_job_queue_this_arn" {
  description = "The Amazon Resource Name of the job queue."
  value       = concat(aws_batch_job_queue.this.*.arn, [""])[0]
}


#####
# Instance Profile
#####

output "iam_role_ecs_instance_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = concat(aws_iam_role.ecs_instance_role.*.arn, [""])[0]
}

output "iam_role_ecs_instance_role_create_date" {
  description = "The creation date of the IAM role."
  value       = concat(aws_iam_role.ecs_instance_role.*.create_date, [""])[0]
}

output "iam_role_ecs_instance_role_description" {
  description = "The description of the role."
  value       = concat(aws_iam_role.ecs_instance_role.*.description, [""])[0]
}

output "iam_role_ecs_instance_role_id" {
  description = "The name of the role."
  value       = concat(aws_iam_role.ecs_instance_role.*.id, [""])[0]
}

output "iam_role_ecs_instance_role_name" {
  description = "The name of the role."
  value       = concat(aws_iam_role.ecs_instance_role.*.name, [""])[0]
}

output "iam_role_ecs_instance_role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = concat(aws_iam_role.ecs_instance_role.*.unique_id, [""])[0]
}


output "iam_instance_profile_ecs_instance_role_id" {
  description = "The instance profile's ID."
  value       = concat(aws_iam_instance_profile.ecs_instance_role.*.id, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_arn" {
  description = "The ARN assigned by AWS to the instance profile."
  value       = concat(aws_iam_instance_profile.ecs_instance_role.*.arn, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_create_date" {
  description = "The creation timestamp of the instance profile."
  value       = concat(aws_iam_instance_profile.ecs_instance_role.*.create_date, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_name" {
  description = "The instance profile's name."
  value       = concat(aws_iam_instance_profile.ecs_instance_role.*.name, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_path" {
  description = "The path of the instance profile in IAM."
  value       = concat(aws_iam_instance_profile.ecs_instance_role.*.path, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_role" {
  description = "The role assigned to the instance profile."
  value       = concat(aws_iam_instance_profile.ecs_instance_role.*.role, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_unique_id" {
  description = "The unique ID assigned by AWS."
  value       = concat(aws_iam_instance_profile.ecs_instance_role.*.unique_id, [""])[0]
}


#####
# Service Role EC2
#####

output "iam_role_service_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = concat(aws_iam_role.service_role.*.arn, [""])[0]
}

output "iam_role_service_role_create_date" {
  description = "The creation date of the IAM role."
  value       = concat(aws_iam_role.service_role.*.create_date, [""])[0]
}

output "iam_role_service_role_description" {
  description = "The description of the role."
  value       = concat(aws_iam_role.service_role.*.description, [""])[0]
}

output "iam_role_service_role_id" {
  description = "The name of the role."
  value       = concat(aws_iam_role.service_role.*.id, [""])[0]
}

output "iam_role_service_role_name" {
  description = "The name of the role."
  value       = concat(aws_iam_role.service_role.*.name, [""])[0]
}

output "iam_role_service_role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = concat(aws_iam_role.service_role.*.unique_id, [""])[0]
}


#####
# Service Role Spot
#####

output "iam_role_service_role_spot_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = concat(aws_iam_role.service_role_spot.*.arn, [""])[0]
}

output "iam_role_service_role_spot_create_date" {
  description = "The creation date of the IAM role."
  value       = concat(aws_iam_role.service_role_spot.*.create_date, [""])[0]
}

output "iam_role_service_role_spot_description" {
  description = "The description of the role."
  value       = concat(aws_iam_role.service_role_spot.*.description, [""])[0]
}

output "iam_role_service_role_spot_id" {
  description = "The name of the role."
  value       = concat(aws_iam_role.service_role_spot.*.id, [""])[0]
}

output "iam_role_service_role_spot_name" {
  description = "The name of the role."
  value       = concat(aws_iam_role.service_role_spot.*.name, [""])[0]
}

output "iam_role_service_role_spot_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = concat(aws_iam_role.service_role_spot.*.unique_id, [""])[0]
}

output "service_linked_role_spot_id" {
  description = "The Amazon Resource Name (ARN) of the role."
  value       = concat(aws_iam_service_linked_role.spot.*.id, [""])[0]
}

output "service_linked_role_spot_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = concat(aws_iam_service_linked_role.spot.*.arn, [""])[0]
}

output "service_linked_role_spot_name" {
  description = "The name of the role."
  value       = concat(aws_iam_service_linked_role.spot.*.name, [""])[0]
}

output "service_linked_role_spot_path" {
  description = "The path of the role."
  value       = concat(aws_iam_service_linked_role.spot.*.path, [""])[0]
}

output "service_linked_role_spot_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = concat(aws_iam_service_linked_role.spot.*.unique_id, [""])[0]
}

output "service_linked_role_spotfleet_id" {
  description = "The Amazon Resource Name (ARN) of the role."
  value       = concat(aws_iam_service_linked_role.spotfleet.*.id, [""])[0]
}

output "service_linked_role_spotfleet_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = concat(aws_iam_service_linked_role.spotfleet.*.arn, [""])[0]
}

output "service_linked_role_spotfleet_name" {
  description = "The name of the role."
  value       = concat(aws_iam_service_linked_role.spotfleet.*.name, [""])[0]
}

output "service_linked_role_spotfleet_path" {
  description = "The path of the role."
  value       = concat(aws_iam_service_linked_role.spotfleet.*.path, [""])[0]
}

output "service_linked_role_spotfleet_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = concat(aws_iam_service_linked_role.spotfleet.*.unique_id, [""])[0]
}


#####
# Security Group
#####

output "security_group_instances_id" {
  description = "The ID of the security group."
  value       = concat(aws_security_group.instances.*.id, [""])[0]
}

output "security_group_instances_arn" {
  description = "The ARN of the security group."
  value       = concat(aws_security_group.instances.*.arn, [""])[0]
}

output "security_group_instances_vpc_id" {
  description = "The VPC ID."
  value       = concat(aws_security_group.instances.*.vpc_id, [""])[0]
}

output "security_group_instances_owner_id" {
  description = "The owner ID."
  value       = concat(aws_security_group.instances.*.owner_id, [""])[0]
}

output "security_group_instances_name" {
  description = "The name of the security group."
  value       = concat(aws_security_group.instances.*.name, [""])[0]
}

output "security_group_instances_description" {
  description = "The description of the security group."
  value       = concat(aws_security_group.instances.*.description, [""])[0]
}

output "security_group_instances_ingress" {
  description = "The ingress rules."
  value       = concat(aws_security_group.instances.*.ingress, [""])[0]
}

output "security_group_instances_egress" {
  description = "The egress rules."
  value       = concat(aws_security_group.instances.*.egress, [""])[0]
}
