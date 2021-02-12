#####
# Default
#####

output "default_batch_compute_environment_arn" {
  value = module.default.batch_compute_environment_arn
}

output "default_batch_compute_environment_ecs_cluster_arn" {
  value = module.default.batch_compute_environment_ecs_cluster_arn
}

output "default_batch_compute_environment_status" {
  value = module.default.batch_compute_environment_status
}

output "default_batch_compute_environment_status_reason" {
  value = module.default.batch_compute_environment_status_reason
}

output "default_batch_job_queue_this_arn" {
  value = module.default.batch_job_queue_this_arn
}

output "default_iam_role_ecs_instance_role_arn" {
  value = module.default.iam_role_ecs_instance_role_arn
}

output "default_iam_role_ecs_instance_role_create_date" {
  value = module.default.iam_role_ecs_instance_role_create_date
}

output "default_iam_role_ecs_instance_role_description" {
  value = module.default.iam_role_ecs_instance_role_description
}

output "default_iam_role_ecs_instance_role_id" {
  value = module.default.iam_role_ecs_instance_role_id
}

output "default_iam_role_ecs_instance_role_name" {
  value = module.default.iam_role_ecs_instance_role_name
}

output "default_iam_role_ecs_instance_role_unique_id" {
  value = module.default.iam_role_ecs_instance_role_unique_id
}

output "default_iam_instance_profile_ecs_instance_role_id" {
  value = module.default.iam_instance_profile_ecs_instance_role_id
}

output "default_iam_instance_profile_ecs_instance_role_arn" {
  value = module.default.iam_instance_profile_ecs_instance_role_arn
}

output "default_iam_instance_profile_ecs_instance_role_create_date" {
  value = module.default.iam_instance_profile_ecs_instance_role_create_date
}

output "default_iam_instance_profile_ecs_instance_role_name" {
  value = module.default.iam_instance_profile_ecs_instance_role_name
}

output "default_iam_instance_profile_ecs_instance_role_path" {
  value = module.default.iam_instance_profile_ecs_instance_role_path
}

output "default_iam_instance_profile_ecs_instance_role_role" {
  value = module.default.iam_instance_profile_ecs_instance_role_role
}

output "default_iam_instance_profile_ecs_instance_role_unique_id" {
  value = module.default.iam_instance_profile_ecs_instance_role_unique_id
}

output "default_iam_role_service_role_arn" {
  value = module.default.iam_role_service_role_arn
}

output "default_iam_role_service_role_create_date" {
  value = module.default.iam_role_service_role_create_date
}

output "default_iam_role_service_role_description" {
  value = module.default.iam_role_service_role_description
}

output "default_iam_role_service_role_id" {
  value = module.default.iam_role_service_role_id
}

output "default_iam_role_service_role_name" {
  value = module.default.iam_role_service_role_name
}

output "default_iam_role_service_role_unique_id" {
  value = module.default.iam_role_service_role_unique_id
}

output "default_iam_role_service_role_spot_arn" {
  value = module.default.iam_role_service_role_spot_arn
}

output "default_iam_role_service_role_spot_create_date" {
  value = module.default.iam_role_service_role_spot_create_date
}

output "default_iam_role_service_role_spot_description" {
  value = module.default.iam_role_service_role_spot_description
}

output "default_iam_role_service_role_spot_id" {
  value = module.default.iam_role_service_role_spot_id
}

output "default_iam_role_service_role_spot_name" {
  value = module.default.iam_role_service_role_spot_name
}

output "default_iam_role_service_role_spot_unique_id" {
  value = module.default.iam_role_service_role_spot_unique_id
}

output "default_service_linked_role_spot_id" {
  value = module.default.service_linked_role_spot_id
}

output "default_service_linked_role_spot_arn" {
  value = module.default.service_linked_role_spot_arn
}

output "default_service_linked_role_spot_name" {
  value = module.default.service_linked_role_spot_name
}

output "default_service_linked_role_spot_path" {
  value = module.default.service_linked_role_spot_path
}

output "default_service_linked_role_spot_unique_id" {
  value = module.default.service_linked_role_spot_unique_id
}

output "default_service_linked_role_spotfleet_id" {
  value = module.default.service_linked_role_spotfleet_id
}

output "default_service_linked_role_spotfleet_arn" {
  value = module.default.service_linked_role_spotfleet_arn
}

output "default_service_linked_role_spotfleet_name" {
  value = module.default.service_linked_role_spotfleet_name
}

output "default_service_linked_role_spotfleet_path" {
  value = module.default.service_linked_role_spotfleet_path
}

output "default_service_linked_role_spotfleet_unique_id" {
  value = module.default.service_linked_role_spotfleet_unique_id
}

output "default_security_group_instances_id" {
  value = module.default.security_group_instances_id
}

output "default_security_group_instances_arn" {
  value = module.default.security_group_instances_arn
}

output "default_security_group_instances_vpc_id" {
  value = module.default.security_group_instances_vpc_id
}

output "default_security_group_instances_owner_id" {
  value = module.default.security_group_instances_owner_id
}

output "default_security_group_instances_name" {
  value = module.default.security_group_instances_name
}

output "default_security_group_instances_description" {
  value = module.default.security_group_instances_description
}

output "default_security_group_instances_ingress" {
  value = module.default.security_group_instances_ingress
}

output "default_security_group_instances_egress" {
  value = module.default.security_group_instances_egress
}

#####
# Extra Env Spot
#####

output "extraenvspot_batch_compute_environment_arn" {
  value = module.extraenvspot.batch_compute_environment_arn
}

output "extraenvspot_batch_compute_environment_ecs_cluster_arn" {
  value = module.extraenvspot.batch_compute_environment_ecs_cluster_arn
}

output "extraenvspot_batch_compute_environment_status" {
  value = module.extraenvspot.batch_compute_environment_status
}

output "extraenvspot_batch_compute_environment_status_reason" {
  value = module.extraenvspot.batch_compute_environment_status_reason
}

output "extraenvspot_batch_job_queue_this_arn" {
  value = module.extraenvspot.batch_job_queue_this_arn
}

output "extraenvspot_iam_role_ecs_instance_role_arn" {
  value = module.extraenvspot.iam_role_ecs_instance_role_arn
}

output "extraenvspot_iam_role_ecs_instance_role_create_date" {
  value = module.extraenvspot.iam_role_ecs_instance_role_create_date
}

output "extraenvspot_iam_role_ecs_instance_role_description" {
  value = module.extraenvspot.iam_role_ecs_instance_role_description
}

output "extraenvspot_iam_role_ecs_instance_role_id" {
  value = module.extraenvspot.iam_role_ecs_instance_role_id
}

output "extraenvspot_iam_role_ecs_instance_role_name" {
  value = module.extraenvspot.iam_role_ecs_instance_role_name
}

output "extraenvspot_iam_role_ecs_instance_role_unique_id" {
  value = module.extraenvspot.iam_role_ecs_instance_role_unique_id
}

output "extraenvspot_iam_instance_profile_ecs_instance_role_id" {
  value = module.extraenvspot.iam_instance_profile_ecs_instance_role_id
}

output "extraenvspot_iam_instance_profile_ecs_instance_role_arn" {
  value = module.extraenvspot.iam_instance_profile_ecs_instance_role_arn
}

output "extraenvspot_iam_instance_profile_ecs_instance_role_create_date" {
  value = module.extraenvspot.iam_instance_profile_ecs_instance_role_create_date
}

output "extraenvspot_iam_instance_profile_ecs_instance_role_name" {
  value = module.extraenvspot.iam_instance_profile_ecs_instance_role_name
}

output "extraenvspot_iam_instance_profile_ecs_instance_role_path" {
  value = module.extraenvspot.iam_instance_profile_ecs_instance_role_path
}

output "extraenvspot_iam_instance_profile_ecs_instance_role_role" {
  value = module.extraenvspot.iam_instance_profile_ecs_instance_role_role
}

output "extraenvspot_iam_instance_profile_ecs_instance_role_unique_id" {
  value = module.extraenvspot.iam_instance_profile_ecs_instance_role_unique_id
}

output "extraenvspot_iam_role_service_role_arn" {
  value = module.extraenvspot.iam_role_service_role_arn
}

output "extraenvspot_iam_role_service_role_create_date" {
  value = module.extraenvspot.iam_role_service_role_create_date
}

output "extraenvspot_iam_role_service_role_description" {
  value = module.extraenvspot.iam_role_service_role_description
}

output "extraenvspot_iam_role_service_role_id" {
  value = module.extraenvspot.iam_role_service_role_id
}

output "extraenvspot_iam_role_service_role_name" {
  value = module.extraenvspot.iam_role_service_role_name
}

output "extraenvspot_iam_role_service_role_unique_id" {
  value = module.extraenvspot.iam_role_service_role_unique_id
}

output "extraenvspot_iam_role_service_role_spot_arn" {
  value = module.extraenvspot.iam_role_service_role_spot_arn
}

output "extraenvspot_iam_role_service_role_spot_create_date" {
  value = module.extraenvspot.iam_role_service_role_spot_create_date
}

output "extraenvspot_iam_role_service_role_spot_description" {
  value = module.extraenvspot.iam_role_service_role_spot_description
}

output "extraenvspot_iam_role_service_role_spot_id" {
  value = module.extraenvspot.iam_role_service_role_spot_id
}

output "extraenvspot_iam_role_service_role_spot_name" {
  value = module.extraenvspot.iam_role_service_role_spot_name
}

output "extraenvspot_iam_role_service_role_spot_unique_id" {
  value = module.extraenvspot.iam_role_service_role_spot_unique_id
}

output "extraenvspot_service_linked_role_spot_id" {
  value = module.extraenvspot.service_linked_role_spot_id
}

output "extraenvspot_service_linked_role_spot_arn" {
  value = module.extraenvspot.service_linked_role_spot_arn
}

output "extraenvspot_service_linked_role_spot_name" {
  value = module.extraenvspot.service_linked_role_spot_name
}

output "extraenvspot_service_linked_role_spot_path" {
  value = module.extraenvspot.service_linked_role_spot_path
}

output "extraenvspot_service_linked_role_spot_unique_id" {
  value = module.extraenvspot.service_linked_role_spot_unique_id
}

output "extraenvspot_service_linked_role_spotfleet_id" {
  value = module.extraenvspot.service_linked_role_spotfleet_id
}

output "extraenvspot_service_linked_role_spotfleet_arn" {
  value = module.extraenvspot.service_linked_role_spotfleet_arn
}

output "extraenvspot_service_linked_role_spotfleet_name" {
  value = module.extraenvspot.service_linked_role_spotfleet_name
}

output "extraenvspot_service_linked_role_spotfleet_path" {
  value = module.extraenvspot.service_linked_role_spotfleet_path
}

output "extraenvspot_service_linked_role_spotfleet_unique_id" {
  value = module.extraenvspot.service_linked_role_spotfleet_unique_id
}

output "extraenvspot_security_group_instances_id" {
  value = module.extraenvspot.security_group_instances_id
}

output "extraenvspot_security_group_instances_arn" {
  value = module.extraenvspot.security_group_instances_arn
}

output "extraenvspot_security_group_instances_vpc_id" {
  value = module.extraenvspot.security_group_instances_vpc_id
}

output "extraenvspot_security_group_instances_owner_id" {
  value = module.extraenvspot.security_group_instances_owner_id
}

output "extraenvspot_security_group_instances_name" {
  value = module.extraenvspot.security_group_instances_name
}

output "extraenvspot_security_group_instances_description" {
  value = module.extraenvspot.security_group_instances_description
}

output "extraenvspot_security_group_instances_ingress" {
  value = module.extraenvspot.security_group_instances_ingress
}

output "extraenvspot_security_group_instances_egress" {
  value = module.extraenvspot.security_group_instances_egress
}

#####
# Extra job queue
#####

output "extrajqueue_batch_compute_environment_arn" {
  value = module.extrajqueue.batch_compute_environment_arn
}

output "extrajqueue_batch_compute_environment_ecs_cluster_arn" {
  value = module.extrajqueue.batch_compute_environment_ecs_cluster_arn
}

output "extrajqueue_batch_compute_environment_status" {
  value = module.extrajqueue.batch_compute_environment_status
}

output "extrajqueue_batch_compute_environment_status_reason" {
  value = module.extrajqueue.batch_compute_environment_status_reason
}

output "extrajqueue_batch_job_queue_this_arn" {
  value = module.extrajqueue.batch_job_queue_this_arn
}

output "extrajqueue_iam_role_ecs_instance_role_arn" {
  value = module.extrajqueue.iam_role_ecs_instance_role_arn
}

output "extrajqueue_iam_role_ecs_instance_role_create_date" {
  value = module.extrajqueue.iam_role_ecs_instance_role_create_date
}

output "extrajqueue_iam_role_ecs_instance_role_description" {
  value = module.extrajqueue.iam_role_ecs_instance_role_description
}

output "extrajqueue_iam_role_ecs_instance_role_id" {
  value = module.extrajqueue.iam_role_ecs_instance_role_id
}

output "extrajqueue_iam_role_ecs_instance_role_name" {
  value = module.extrajqueue.iam_role_ecs_instance_role_name
}

output "extrajqueue_iam_role_ecs_instance_role_unique_id" {
  value = module.extrajqueue.iam_role_ecs_instance_role_unique_id
}

output "extrajqueue_iam_instance_profile_ecs_instance_role_id" {
  value = module.extrajqueue.iam_instance_profile_ecs_instance_role_id
}

output "extrajqueue_iam_instance_profile_ecs_instance_role_arn" {
  value = module.extrajqueue.iam_instance_profile_ecs_instance_role_arn
}

output "extrajqueue_iam_instance_profile_ecs_instance_role_create_date" {
  value = module.extrajqueue.iam_instance_profile_ecs_instance_role_create_date
}

output "extrajqueue_iam_instance_profile_ecs_instance_role_name" {
  value = module.extrajqueue.iam_instance_profile_ecs_instance_role_name
}

output "extrajqueue_iam_instance_profile_ecs_instance_role_path" {
  value = module.extrajqueue.iam_instance_profile_ecs_instance_role_path
}

output "extrajqueue_iam_instance_profile_ecs_instance_role_role" {
  value = module.extrajqueue.iam_instance_profile_ecs_instance_role_role
}

output "extrajqueue_iam_instance_profile_ecs_instance_role_unique_id" {
  value = module.extrajqueue.iam_instance_profile_ecs_instance_role_unique_id
}

output "extrajqueue_iam_role_service_role_arn" {
  value = module.extrajqueue.iam_role_service_role_arn
}

output "extrajqueue_iam_role_service_role_create_date" {
  value = module.extrajqueue.iam_role_service_role_create_date
}

output "extrajqueue_iam_role_service_role_description" {
  value = module.extrajqueue.iam_role_service_role_description
}

output "extrajqueue_iam_role_service_role_id" {
  value = module.extrajqueue.iam_role_service_role_id
}

output "extrajqueue_iam_role_service_role_name" {
  value = module.extrajqueue.iam_role_service_role_name
}

output "extrajqueue_iam_role_service_role_unique_id" {
  value = module.extrajqueue.iam_role_service_role_unique_id
}

output "extrajqueue_iam_role_service_role_spot_arn" {
  value = module.extrajqueue.iam_role_service_role_spot_arn
}

output "extrajqueue_iam_role_service_role_spot_create_date" {
  value = module.extrajqueue.iam_role_service_role_spot_create_date
}

output "extrajqueue_iam_role_service_role_spot_description" {
  value = module.extrajqueue.iam_role_service_role_spot_description
}

output "extrajqueue_iam_role_service_role_spot_id" {
  value = module.extrajqueue.iam_role_service_role_spot_id
}

output "extrajqueue_iam_role_service_role_spot_name" {
  value = module.extrajqueue.iam_role_service_role_spot_name
}

output "extrajqueue_iam_role_service_role_spot_unique_id" {
  value = module.extrajqueue.iam_role_service_role_spot_unique_id
}

output "extrajqueue_service_linked_role_spot_id" {
  value = module.extrajqueue.service_linked_role_spot_id
}

output "extrajqueue_service_linked_role_spot_arn" {
  value = module.extrajqueue.service_linked_role_spot_arn
}

output "extrajqueue_service_linked_role_spot_name" {
  value = module.extrajqueue.service_linked_role_spot_name
}

output "extrajqueue_service_linked_role_spot_path" {
  value = module.extrajqueue.service_linked_role_spot_path
}

output "extrajqueue_service_linked_role_spot_unique_id" {
  value = module.extrajqueue.service_linked_role_spot_unique_id
}

output "extrajqueue_service_linked_role_spotfleet_id" {
  value = module.extrajqueue.service_linked_role_spotfleet_id
}

output "extrajqueue_service_linked_role_spotfleet_arn" {
  value = module.extrajqueue.service_linked_role_spotfleet_arn
}

output "extrajqueue_service_linked_role_spotfleet_name" {
  value = module.extrajqueue.service_linked_role_spotfleet_name
}

output "extrajqueue_service_linked_role_spotfleet_path" {
  value = module.extrajqueue.service_linked_role_spotfleet_path
}

output "extrajqueue_service_linked_role_spotfleet_unique_id" {
  value = module.extrajqueue.service_linked_role_spotfleet_unique_id
}

output "extrajqueue_security_group_instances_id" {
  value = module.extrajqueue.security_group_instances_id
}

output "extrajqueue_security_group_instances_arn" {
  value = module.extrajqueue.security_group_instances_arn
}

output "extrajqueue_security_group_instances_vpc_id" {
  value = module.extrajqueue.security_group_instances_vpc_id
}

output "extrajqueue_security_group_instances_owner_id" {
  value = module.extrajqueue.security_group_instances_owner_id
}

output "extrajqueue_security_group_instances_name" {
  value = module.extrajqueue.security_group_instances_name
}

output "extrajqueue_security_group_instances_description" {
  value = module.extrajqueue.security_group_instances_description
}

output "extrajqueue_security_group_instances_ingress" {
  value = module.extrajqueue.security_group_instances_ingress
}

output "extrajqueue_security_group_instances_egress" {
  value = module.extrajqueue.security_group_instances_egress
}
