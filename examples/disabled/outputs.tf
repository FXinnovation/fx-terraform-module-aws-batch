output "batch_compute_environment_arn" {
  value = concat(module.disabled.*.batch_compute_environment_arn, [""])[0]
}

output "batch_compute_environment_ecs_cluster_arn" {
  value = concat(module.disabled.*.batch_compute_environment_ecs_cluster_arn, [""])[0]
}

output "batch_compute_environment_status" {
  value = concat(module.disabled.*.batch_compute_environment_status, [""])[0]
}

output "batch_compute_environment_status_reason" {
  value = concat(module.disabled.*.batch_compute_environment_status_reason, [""])[0]
}

output "batch_job_queue_this_arn" {
  value = concat(module.disabled.*.batch_job_queue_this_arn, [""])[0]
}

output "iam_role_ecs_instance_role_arn" {
  value = concat(module.disabled.*.iam_role_ecs_instance_role_arn, [""])[0]
}

output "iam_role_ecs_instance_role_create_date" {
  value = concat(module.disabled.*.iam_role_ecs_instance_role_create_date, [""])[0]
}

output "iam_role_ecs_instance_role_description" {
  value = concat(module.disabled.*.iam_role_ecs_instance_role_description, [""])[0]
}

output "iam_role_ecs_instance_role_id" {
  value = concat(module.disabled.*.iam_role_ecs_instance_role_id, [""])[0]
}

output "iam_role_ecs_instance_role_name" {
  value = concat(module.disabled.*.iam_role_ecs_instance_role_name, [""])[0]
}

output "iam_role_ecs_instance_role_unique_id" {
  value = concat(module.disabled.*.iam_role_ecs_instance_role_unique_id, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_id" {
  value = concat(module.disabled.*.iam_instance_profile_ecs_instance_role_id, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_arn" {
  value = concat(module.disabled.*.iam_instance_profile_ecs_instance_role_arn, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_create_date" {
  value = concat(module.disabled.*.iam_instance_profile_ecs_instance_role_create_date, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_name" {
  value = concat(module.disabled.*.iam_instance_profile_ecs_instance_role_name, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_path" {
  value = concat(module.disabled.*.iam_instance_profile_ecs_instance_role_path, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_role" {
  value = concat(module.disabled.*.iam_instance_profile_ecs_instance_role_role, [""])[0]
}

output "iam_instance_profile_ecs_instance_role_unique_id" {
  value = concat(module.disabled.*.iam_instance_profile_ecs_instance_role_unique_id, [""])[0]
}

output "iam_role_service_role_arn" {
  value = concat(module.disabled.*.iam_role_service_role_arn, [""])[0]
}

output "iam_role_service_role_create_date" {
  value = concat(module.disabled.*.iam_role_service_role_create_date, [""])[0]
}

output "iam_role_service_role_description" {
  value = concat(module.disabled.*.iam_role_service_role_description, [""])[0]
}

output "iam_role_service_role_id" {
  value = concat(module.disabled.*.iam_role_service_role_id, [""])[0]
}

output "iam_role_service_role_name" {
  value = concat(module.disabled.*.iam_role_service_role_name, [""])[0]
}

output "iam_role_service_role_unique_id" {
  value = concat(module.disabled.*.iam_role_service_role_unique_id, [""])[0]
}

output "iam_role_service_role_spot_arn" {
  value = concat(module.disabled.*.iam_role_service_role_spot_arn, [""])[0]
}

output "iam_role_service_role_spot_create_date" {
  value = concat(module.disabled.*.iam_role_service_role_spot_create_date, [""])[0]
}

output "iam_role_service_role_spot_description" {
  value = concat(module.disabled.*.iam_role_service_role_spot_description, [""])[0]
}

output "iam_role_service_role_spot_id" {
  value = concat(module.disabled.*.iam_role_service_role_spot_id, [""])[0]
}

output "iam_role_service_role_spot_name" {
  value = concat(module.disabled.*.iam_role_service_role_spot_name, [""])[0]
}

output "iam_role_service_role_spot_unique_id" {
  value = concat(module.disabled.*.iam_role_service_role_spot_unique_id, [""])[0]
}

output "service_linked_role_spot_id" {
  value = concat(module.disabled.*.service_linked_role_spot_id, [""])[0]
}

output "service_linked_role_spot_arn" {
  value = concat(module.disabled.*.service_linked_role_spot_arn, [""])[0]
}

output "service_linked_role_spot_name" {
  value = concat(module.disabled.*.service_linked_role_spot_name, [""])[0]
}

output "service_linked_role_spot_path" {
  value = concat(module.disabled.*.service_linked_role_spot_path, [""])[0]
}

output "service_linked_role_spot_unique_id" {
  value = concat(module.disabled.*.service_linked_role_spot_unique_id, [""])[0]
}

output "service_linked_role_spotfleet_id" {
  value = concat(module.disabled.*.service_linked_role_spotfleet_id, [""])[0]
}

output "service_linked_role_spotfleet_arn" {
  value = concat(module.disabled.*.service_linked_role_spotfleet_arn, [""])[0]
}

output "service_linked_role_spotfleet_name" {
  value = concat(module.disabled.*.service_linked_role_spotfleet_name, [""])[0]
}

output "service_linked_role_spotfleet_path" {
  value = concat(module.disabled.*.service_linked_role_spotfleet_path, [""])[0]
}

output "service_linked_role_spotfleet_unique_id" {
  value = concat(module.disabled.*.service_linked_role_spotfleet_unique_id, [""])[0]
}

output "security_group_instances_id" {
  value = concat(module.disabled.*.security_group_instances_id, [""])[0]
}

output "security_group_instances_arn" {
  value = concat(module.disabled.*.security_group_instances_arn, [""])[0]
}

output "security_group_instances_vpc_id" {
  value = concat(module.disabled.*.security_group_instances_vpc_id, [""])[0]
}

output "security_group_instances_owner_id" {
  value = concat(module.disabled.*.security_group_instances_owner_id, [""])[0]
}

output "security_group_instances_name" {
  value = concat(module.disabled.*.security_group_instances_name, [""])[0]
}

output "security_group_instances_description" {
  value = concat(module.disabled.*.security_group_instances_description, [""])[0]
}

output "security_group_instances_ingress" {
  value = concat(module.disabled.*.security_group_instances_ingress, [""])[0]
}

output "security_group_instances_egress" {
  value = concat(module.disabled.*.security_group_instances_egress, [""])[0]
}
