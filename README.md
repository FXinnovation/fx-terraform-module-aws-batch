# terraform-module-aws-batch

Terraform module to deploy Batch on AWS.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_batch_compute_environment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_compute_environment) | resource |
| [aws_batch_job_queue.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_queue) | resource |
| [aws_iam_instance_profile.ecs_instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.ecs_instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.service_role_spot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.additional_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_additional_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.service_role_spot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_service_linked_role.spot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) | resource |
| [aws_iam_service_linked_role.spotfleet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) | resource |
| [aws_security_group.instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.instances_egress_open](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_iam_policy_document.sts_batch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sts_ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sts_spotfleet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_iam_policy_arns"></a> [additional\_iam\_policy\_arns](#input\_additional\_iam\_policy\_arns) | add additional policy arns to service role | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_attach_additional_policy"></a> [attach\_additional\_policy](#input\_attach\_additional\_policy) | whether to add additional polices or not | `bool` | `false` | no |
| <a name="input_compute_environment_arns"></a> [compute\_environment\_arns](#input\_compute\_environment\_arns) | (Needed if compute\_environment\_create == false) Specifies the set of compute environments (ARNs) mapped to a job queue and their order. The position of the compute environments in the list will dictate the order. You can associate up to 3 compute environments with a job queue | `list(string)` | `[]` | no |
| <a name="input_compute_environment_create"></a> [compute\_environment\_create](#input\_compute\_environment\_create) | Whether or not to create a compute environment for Batch | `bool` | `true` | no |
| <a name="input_compute_environment_enabled"></a> [compute\_environment\_enabled](#input\_compute\_environment\_enabled) | Whether or not to enable the compute environment (toggles compute\_environment.state ENABLED/DISABLED.). | `bool` | `true` | no |
| <a name="input_compute_environment_managed"></a> [compute\_environment\_managed](#input\_compute\_environment\_managed) | Whether or not to manage the compute environment (toggles compute\_environment.type MANAGED/UNMANAGED). | `bool` | `true` | no |
| <a name="input_compute_environment_name"></a> [compute\_environment\_name](#input\_compute\_environment\_name) | (Optional, Forces new resource) The name for your compute environment. Up to 128 letters (uppercase and lowercase), numbers, hyphens and underscores are allowed. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| <a name="input_compute_environment_name_prefix"></a> [compute\_environment\_name\_prefix](#input\_compute\_environment\_name\_prefix) | (Optional, Forces new resource) Creates a unique compute environment name beginning with the specified prefix. Conflicts with compute\_environment\_name. | `string` | `null` | no |
| <a name="input_compute_environment_tags"></a> [compute\_environment\_tags](#input\_compute\_environment\_tags) | Key-value map of resource tags for the compute environment (merged with `var.tags`) | `map(string)` | `{}` | no |
| <a name="input_compute_resource_allocation_strategy"></a> [compute\_resource\_allocation\_strategy](#input\_compute\_resource\_allocation\_strategy) | The allocation strategy to use for the compute resource in case not enough instances of the best fitting instance type can be allocated. Valid items are BEST\_FIT\_PROGRESSIVE, SPOT\_CAPACITY\_OPTIMIZED or BEST\_FIT. | `string` | `"BEST_FIT_PROGRESSIVE"` | no |
| <a name="input_compute_resource_bid_percentage"></a> [compute\_resource\_bid\_percentage](#input\_compute\_resource\_bid\_percentage) | Integer of minimum percentage that a Spot Instance price must be when compared with the On-Demand price for that instance type before instances are launched. For example, if your bid percentage is 20% (20), then the Spot price must be below 20% of the current On-Demand price for that EC2 instance. This parameter is required for SPOT compute environments. | `number` | `null` | no |
| <a name="input_compute_resource_desired_vcpus"></a> [compute\_resource\_desired\_vcpus](#input\_compute\_resource\_desired\_vcpus) | The desired number of EC2 vCPUS in the compute environment. | `number` | `null` | no |
| <a name="input_compute_resource_ec2_key_pair"></a> [compute\_resource\_ec2\_key\_pair](#input\_compute\_resource\_ec2\_key\_pair) | The EC2 key pair that is used for instances launched in the compute environment. | `string` | `null` | no |
| <a name="input_compute_resource_image_id"></a> [compute\_resource\_image\_id](#input\_compute\_resource\_image\_id) | The Amazon Machine Image (AMI) ID used for instances launched in the compute environment | `string` | `null` | no |
| <a name="input_compute_resource_instance_type"></a> [compute\_resource\_instance\_type](#input\_compute\_resource\_instance\_type) | The instances types that can be launched. You can specify instance families to launch any instance type within those families (for example, c5 or p3), or you can specify specific sizes within a family (such as c5.8xlarge). You can also choose optimal to select instance types (from the C4, M4, and R4 instance families) that match the demand of your job queues. | `list(string)` | <pre>[<br>  "c5.large"<br>]</pre> | no |
| <a name="input_compute_resource_launch_template"></a> [compute\_resource\_launch\_template](#input\_compute\_resource\_launch\_template) | Launch template configuration for compute environment format: list(object({ launch\_template\_id = string, version = optional(number) })) | `list(any)` | `[]` | no |
| <a name="input_compute_resource_max_vcpus"></a> [compute\_resource\_max\_vcpus](#input\_compute\_resource\_max\_vcpus) | The maximum number of EC2 vCPUs that an environment can reach. | `number` | `16` | no |
| <a name="input_compute_resource_min_vcpus"></a> [compute\_resource\_min\_vcpus](#input\_compute\_resource\_min\_vcpus) | The minimum number of EC2 vCPUs that an environment should maintain. | `number` | `0` | no |
| <a name="input_compute_resource_spot_iam_fleet_role"></a> [compute\_resource\_spot\_iam\_fleet\_role](#input\_compute\_resource\_spot\_iam\_fleet\_role) | (Needed for Spot if service\_role\_spot\_create == false)The Amazon Resource Name (ARN) of the Amazon EC2 Spot Fleet IAM role applied to a SPOT compute environment. This parameter is required for SPOT compute environments. | `string` | `null` | no |
| <a name="input_compute_resource_subnet_ids"></a> [compute\_resource\_subnet\_ids](#input\_compute\_resource\_subnet\_ids) | A list of VPC subnets into which the compute resources are launched | `list(string)` | n/a | yes |
| <a name="input_compute_resource_tags"></a> [compute\_resource\_tags](#input\_compute\_resource\_tags) | Tags to be used for compute resources (merged with `var.tags`). | `map(string)` | `{}` | no |
| <a name="input_compute_resource_type"></a> [compute\_resource\_type](#input\_compute\_resource\_type) | The type of compute environment. Valid items are EC2 or SPOT. | `string` | `"EC2"` | no |
| <a name="input_ecs_instance_profile_additional_iam_policy_arns"></a> [ecs\_instance\_profile\_additional\_iam\_policy\_arns](#input\_ecs\_instance\_profile\_additional\_iam\_policy\_arns) | List of IAM policies ARNs to attach to ECS Instance Profile | `list(string)` | `[]` | no |
| <a name="input_ecs_instance_profile_arn"></a> [ecs\_instance\_profile\_arn](#input\_ecs\_instance\_profile\_arn) | (Needed if service\_role\_create == false) The Amazon ECS instance role applied to Amazon EC2 instances in a compute environment. | `string` | `null` | no |
| <a name="input_ecs_instance_profile_create"></a> [ecs\_instance\_profile\_create](#input\_ecs\_instance\_profile\_create) | Whether or not to create instance profile for ECS instances | `bool` | `true` | no |
| <a name="input_ecs_instance_profile_name"></a> [ecs\_instance\_profile\_name](#input\_ecs\_instance\_profile\_name) | The IAM profile's name for the EC2 instance (or launch template). If `var.ecs_instance_profile_create` is `true` and this is null, Terraform will assign a random, unique name. If `var.ecs_instance_profile_create` is `false` this value should be the name of an external IAM Instance Profile. | `string` | `"BatchEcsInstanceRole"` | no |
| <a name="input_ecs_instance_profile_path"></a> [ecs\_instance\_profile\_path](#input\_ecs\_instance\_profile\_path) | Path in which to create the Instance Profile for the EC2 instance (or launch template). Instance Profile IAM Role will share the same path. Ignored if `var.ecs_instance_profile_create` is `false`. | `string` | `null` | no |
| <a name="input_ecs_instance_role_description"></a> [ecs\_instance\_role\_description](#input\_ecs\_instance\_role\_description) | Description of the IAM Role to be used by the Instance Profile. Ignored if `var.ecs_instance_profile_create` is `false`. | `string` | `"Instance Profile Role For Batch Instances"` | no |
| <a name="input_ecs_instance_role_name"></a> [ecs\_instance\_role\_name](#input\_ecs\_instance\_role\_name) | Name of the IAM Role to be used by the Instance Profile. If null, Terraform will assign a random, unique name. Ignored if `var.ecs_instance_profile_create` is `false`. | `string` | `"BatchEcsInstanceRole"` | no |
| <a name="input_ecs_instance_role_path"></a> [ecs\_instance\_role\_path](#input\_ecs\_instance\_role\_path) | Path in which to create the Instance Profile for the EC2 instance (or launch template). Instance Profile IAM Role will share the same path. Ignored if `var.ecs_instance_profile_create` is `false`. | `any` | `null` | no |
| <a name="input_ecs_instance_role_tags"></a> [ecs\_instance\_role\_tags](#input\_ecs\_instance\_role\_tags) | Tags to be used for the Instance Profile Role (merged with `var.tags`). | `map(string)` | `{}` | no |
| <a name="input_instance_sg_create"></a> [instance\_sg\_create](#input\_instance\_sg\_create) | Whether or not to create Security Group for Batch instances | `bool` | `true` | no |
| <a name="input_instance_sg_ids"></a> [instance\_sg\_ids](#input\_instance\_sg\_ids) | (Needed if instance\_sg\_create == false) A list of EC2 security group that are associated with instances launched in the compute environment | `list(string)` | `[]` | no |
| <a name="input_instance_sg_name"></a> [instance\_sg\_name](#input\_instance\_sg\_name) | SG name for Batch instances | `string` | `"SG for Batch instances"` | no |
| <a name="input_instance_sg_tags"></a> [instance\_sg\_tags](#input\_instance\_sg\_tags) | Tags to be used for the instances SG (merged with `var.tags`). | `map(string)` | `{}` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix to be added to with all resource's names of the module. Prefix is mainly used for tests and should remain empty in normal circumstances. | `string` | `""` | no |
| <a name="input_queue_create"></a> [queue\_create](#input\_queue\_create) | Whether or not to create a job queue for Batch | `bool` | `true` | no |
| <a name="input_queue_enabled"></a> [queue\_enabled](#input\_queue\_enabled) | Whether or not to enable job queue (toggles aws\_batch\_job\_queue.state ENABLED/DISABLED).) | `bool` | `true` | no |
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | Specifies the name of the job queue. | `string` | `"job-queue"` | no |
| <a name="input_queue_priority"></a> [queue\_priority](#input\_queue\_priority) | The priority of the job queue. Job queues with a higher priority are evaluated first when associated with the same compute environment. | `number` | `1` | no |
| <a name="input_queue_tags"></a> [queue\_tags](#input\_queue\_tags) | Tags to be used for the job queue (merged with `var.tags`). | `map(string)` | `{}` | no |
| <a name="input_service_linked_role_spot_create"></a> [service\_linked\_role\_spot\_create](#input\_service\_linked\_role\_spot\_create) | Whether or not to create service role for Spot | `bool` | `true` | no |
| <a name="input_service_linked_role_spot_description"></a> [service\_linked\_role\_spot\_description](#input\_service\_linked\_role\_spot\_description) | Description attached to the service linked role | `string` | `"Spot service linked role"` | no |
| <a name="input_service_linked_role_spotfleet_create"></a> [service\_linked\_role\_spotfleet\_create](#input\_service\_linked\_role\_spotfleet\_create) | Whether or not to create service role for Spot | `bool` | `true` | no |
| <a name="input_service_linked_role_spotfleet_description"></a> [service\_linked\_role\_spotfleet\_description](#input\_service\_linked\_role\_spotfleet\_description) | Description attached to the service linked role | `string` | `"Spotfleet service linked role"` | no |
| <a name="input_service_role_arn"></a> [service\_role\_arn](#input\_service\_role\_arn) | (Needed if service\_role\_create == false) Full Amazon Resource Name (ARN) of the IAM role that allows AWS Batch to make calls to other AWS services on your behalf. | `string` | `null` | no |
| <a name="input_service_role_create"></a> [service\_role\_create](#input\_service\_role\_create) | Whether or not to create service role for Batch | `bool` | `true` | no |
| <a name="input_service_role_description"></a> [service\_role\_description](#input\_service\_role\_description) | Description of the IAM Role to be used by the Batch. Ignored if `var.service_role_create` is `false`. | `string` | `"Service Role For Batch"` | no |
| <a name="input_service_role_name"></a> [service\_role\_name](#input\_service\_role\_name) | Instance role name for ECS instances | `string` | `"BatchServiceRoleEC2"` | no |
| <a name="input_service_role_path"></a> [service\_role\_path](#input\_service\_role\_path) | Path in which to create the service role for Batch. Ignored if `var.service_role_create` is `false`. | `string` | `null` | no |
| <a name="input_service_role_spot_create"></a> [service\_role\_spot\_create](#input\_service\_role\_spot\_create) | Whether or not to create service role for Spot | `bool` | `true` | no |
| <a name="input_service_role_spot_description"></a> [service\_role\_spot\_description](#input\_service\_role\_spot\_description) | Description of the IAM Role to be used by the Batch. Ignored if `var.service_role_spot_create` is `false`. | `string` | `"Service Role Spot For Batch"` | no |
| <a name="input_service_role_spot_name"></a> [service\_role\_spot\_name](#input\_service\_role\_spot\_name) | Instance role name for ECS instances | `string` | `"AmazonEC2SpotFleetTaggingRole"` | no |
| <a name="input_service_role_spot_path"></a> [service\_role\_spot\_path](#input\_service\_role\_spot\_path) | Path in which to create the service role for Batch. Ignored if `var.service_role_spot_create` is `false`. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags that will be applied on all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_batch_compute_environment_arn"></a> [batch\_compute\_environment\_arn](#output\_batch\_compute\_environment\_arn) | The Amazon Resource Name (ARN) of the compute environment. |
| <a name="output_batch_compute_environment_ecs_cluster_arn"></a> [batch\_compute\_environment\_ecs\_cluster\_arn](#output\_batch\_compute\_environment\_ecs\_cluster\_arn) | The Amazon Resource Name (ARN) of the underlying Amazon ECS cluster used by the compute environment. |
| <a name="output_batch_compute_environment_status"></a> [batch\_compute\_environment\_status](#output\_batch\_compute\_environment\_status) | The current status of the compute environment (for example, CREATING or VALID). |
| <a name="output_batch_compute_environment_status_reason"></a> [batch\_compute\_environment\_status\_reason](#output\_batch\_compute\_environment\_status\_reason) | A short, human-readable string to provide additional details about the current status of the compute environment. |
| <a name="output_batch_job_queue_this_arn"></a> [batch\_job\_queue\_this\_arn](#output\_batch\_job\_queue\_this\_arn) | The Amazon Resource Name of the job queue. |
| <a name="output_iam_instance_profile_ecs_instance_role_arn"></a> [iam\_instance\_profile\_ecs\_instance\_role\_arn](#output\_iam\_instance\_profile\_ecs\_instance\_role\_arn) | The ARN assigned by AWS to the instance profile. |
| <a name="output_iam_instance_profile_ecs_instance_role_create_date"></a> [iam\_instance\_profile\_ecs\_instance\_role\_create\_date](#output\_iam\_instance\_profile\_ecs\_instance\_role\_create\_date) | The creation timestamp of the instance profile. |
| <a name="output_iam_instance_profile_ecs_instance_role_id"></a> [iam\_instance\_profile\_ecs\_instance\_role\_id](#output\_iam\_instance\_profile\_ecs\_instance\_role\_id) | The instance profile's ID. |
| <a name="output_iam_instance_profile_ecs_instance_role_name"></a> [iam\_instance\_profile\_ecs\_instance\_role\_name](#output\_iam\_instance\_profile\_ecs\_instance\_role\_name) | The instance profile's name. |
| <a name="output_iam_instance_profile_ecs_instance_role_path"></a> [iam\_instance\_profile\_ecs\_instance\_role\_path](#output\_iam\_instance\_profile\_ecs\_instance\_role\_path) | The path of the instance profile in IAM. |
| <a name="output_iam_instance_profile_ecs_instance_role_role"></a> [iam\_instance\_profile\_ecs\_instance\_role\_role](#output\_iam\_instance\_profile\_ecs\_instance\_role\_role) | The role assigned to the instance profile. |
| <a name="output_iam_instance_profile_ecs_instance_role_unique_id"></a> [iam\_instance\_profile\_ecs\_instance\_role\_unique\_id](#output\_iam\_instance\_profile\_ecs\_instance\_role\_unique\_id) | The unique ID assigned by AWS. |
| <a name="output_iam_role_ecs_instance_role_arn"></a> [iam\_role\_ecs\_instance\_role\_arn](#output\_iam\_role\_ecs\_instance\_role\_arn) | The Amazon Resource Name (ARN) specifying the role. |
| <a name="output_iam_role_ecs_instance_role_create_date"></a> [iam\_role\_ecs\_instance\_role\_create\_date](#output\_iam\_role\_ecs\_instance\_role\_create\_date) | The creation date of the IAM role. |
| <a name="output_iam_role_ecs_instance_role_description"></a> [iam\_role\_ecs\_instance\_role\_description](#output\_iam\_role\_ecs\_instance\_role\_description) | The description of the role. |
| <a name="output_iam_role_ecs_instance_role_id"></a> [iam\_role\_ecs\_instance\_role\_id](#output\_iam\_role\_ecs\_instance\_role\_id) | The name of the role. |
| <a name="output_iam_role_ecs_instance_role_name"></a> [iam\_role\_ecs\_instance\_role\_name](#output\_iam\_role\_ecs\_instance\_role\_name) | The name of the role. |
| <a name="output_iam_role_ecs_instance_role_unique_id"></a> [iam\_role\_ecs\_instance\_role\_unique\_id](#output\_iam\_role\_ecs\_instance\_role\_unique\_id) | The stable and unique string identifying the role. |
| <a name="output_iam_role_service_role_arn"></a> [iam\_role\_service\_role\_arn](#output\_iam\_role\_service\_role\_arn) | The Amazon Resource Name (ARN) specifying the role. |
| <a name="output_iam_role_service_role_create_date"></a> [iam\_role\_service\_role\_create\_date](#output\_iam\_role\_service\_role\_create\_date) | The creation date of the IAM role. |
| <a name="output_iam_role_service_role_description"></a> [iam\_role\_service\_role\_description](#output\_iam\_role\_service\_role\_description) | The description of the role. |
| <a name="output_iam_role_service_role_id"></a> [iam\_role\_service\_role\_id](#output\_iam\_role\_service\_role\_id) | The name of the role. |
| <a name="output_iam_role_service_role_name"></a> [iam\_role\_service\_role\_name](#output\_iam\_role\_service\_role\_name) | The name of the role. |
| <a name="output_iam_role_service_role_spot_arn"></a> [iam\_role\_service\_role\_spot\_arn](#output\_iam\_role\_service\_role\_spot\_arn) | The Amazon Resource Name (ARN) specifying the role. |
| <a name="output_iam_role_service_role_spot_create_date"></a> [iam\_role\_service\_role\_spot\_create\_date](#output\_iam\_role\_service\_role\_spot\_create\_date) | The creation date of the IAM role. |
| <a name="output_iam_role_service_role_spot_description"></a> [iam\_role\_service\_role\_spot\_description](#output\_iam\_role\_service\_role\_spot\_description) | The description of the role. |
| <a name="output_iam_role_service_role_spot_id"></a> [iam\_role\_service\_role\_spot\_id](#output\_iam\_role\_service\_role\_spot\_id) | The name of the role. |
| <a name="output_iam_role_service_role_spot_name"></a> [iam\_role\_service\_role\_spot\_name](#output\_iam\_role\_service\_role\_spot\_name) | The name of the role. |
| <a name="output_iam_role_service_role_spot_unique_id"></a> [iam\_role\_service\_role\_spot\_unique\_id](#output\_iam\_role\_service\_role\_spot\_unique\_id) | The stable and unique string identifying the role. |
| <a name="output_iam_role_service_role_unique_id"></a> [iam\_role\_service\_role\_unique\_id](#output\_iam\_role\_service\_role\_unique\_id) | The stable and unique string identifying the role. |
| <a name="output_security_group_instances_arn"></a> [security\_group\_instances\_arn](#output\_security\_group\_instances\_arn) | The ARN of the security group. |
| <a name="output_security_group_instances_description"></a> [security\_group\_instances\_description](#output\_security\_group\_instances\_description) | The description of the security group. |
| <a name="output_security_group_instances_egress"></a> [security\_group\_instances\_egress](#output\_security\_group\_instances\_egress) | The egress rules. |
| <a name="output_security_group_instances_id"></a> [security\_group\_instances\_id](#output\_security\_group\_instances\_id) | The ID of the security group. |
| <a name="output_security_group_instances_ingress"></a> [security\_group\_instances\_ingress](#output\_security\_group\_instances\_ingress) | The ingress rules. |
| <a name="output_security_group_instances_name"></a> [security\_group\_instances\_name](#output\_security\_group\_instances\_name) | The name of the security group. |
| <a name="output_security_group_instances_owner_id"></a> [security\_group\_instances\_owner\_id](#output\_security\_group\_instances\_owner\_id) | The owner ID. |
| <a name="output_security_group_instances_vpc_id"></a> [security\_group\_instances\_vpc\_id](#output\_security\_group\_instances\_vpc\_id) | The VPC ID. |
| <a name="output_service_linked_role_spot_arn"></a> [service\_linked\_role\_spot\_arn](#output\_service\_linked\_role\_spot\_arn) | The Amazon Resource Name (ARN) specifying the role. |
| <a name="output_service_linked_role_spot_id"></a> [service\_linked\_role\_spot\_id](#output\_service\_linked\_role\_spot\_id) | The Amazon Resource Name (ARN) of the role. |
| <a name="output_service_linked_role_spot_name"></a> [service\_linked\_role\_spot\_name](#output\_service\_linked\_role\_spot\_name) | The name of the role. |
| <a name="output_service_linked_role_spot_path"></a> [service\_linked\_role\_spot\_path](#output\_service\_linked\_role\_spot\_path) | The path of the role. |
| <a name="output_service_linked_role_spot_unique_id"></a> [service\_linked\_role\_spot\_unique\_id](#output\_service\_linked\_role\_spot\_unique\_id) | The stable and unique string identifying the role. |
| <a name="output_service_linked_role_spotfleet_arn"></a> [service\_linked\_role\_spotfleet\_arn](#output\_service\_linked\_role\_spotfleet\_arn) | The Amazon Resource Name (ARN) specifying the role. |
| <a name="output_service_linked_role_spotfleet_id"></a> [service\_linked\_role\_spotfleet\_id](#output\_service\_linked\_role\_spotfleet\_id) | The Amazon Resource Name (ARN) of the role. |
| <a name="output_service_linked_role_spotfleet_name"></a> [service\_linked\_role\_spotfleet\_name](#output\_service\_linked\_role\_spotfleet\_name) | The name of the role. |
| <a name="output_service_linked_role_spotfleet_path"></a> [service\_linked\_role\_spotfleet\_path](#output\_service\_linked\_role\_spotfleet\_path) | The path of the role. |
| <a name="output_service_linked_role_spotfleet_unique_id"></a> [service\_linked\_role\_spotfleet\_unique\_id](#output\_service\_linked\_role\_spotfleet\_unique\_id) | The stable and unique string identifying the role. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
