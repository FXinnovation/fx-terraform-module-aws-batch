# terraform-module-aws-batch

Terraform module to deploy Batch on AWS.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_batch_compute_environment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_compute_environment) |
| [aws_batch_job_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_queue) |
| [aws_iam_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |
| [aws_iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) |
| [aws_iam_service_linked_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) |
| [aws_security_group_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) |
| [aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_iam\_policy\_arns | add additional policy arns to service role | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| attach\_additional\_policy | whether to add additional polices or not | `bool` | `false` | no |
| compute\_environment\_arns | (Needed if compute\_environment\_create == false) Specifies the set of compute environments (ARNs) mapped to a job queue and their order. The position of the compute environments in the list will dictate the order. You can associate up to 3 compute environments with a job queue | `list(string)` | `[]` | no |
| compute\_environment\_create | Whether or not to create a compute environment for Batch | `bool` | `true` | no |
| compute\_environment\_enabled | Whether or not to enable the compute environment (toggles compute\_environment.state ENABLED/DISABLED.). | `bool` | `true` | no |
| compute\_environment\_managed | Whether or not to manage the compute environment (toggles compute\_environment.type MANAGED/UNMANAGED). | `bool` | `true` | no |
| compute\_environment\_name | (Optional, Forces new resource) The name for your compute environment. Up to 128 letters (uppercase and lowercase), numbers, hyphens and underscores are allowed. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| compute\_environment\_name\_prefix | (Optional, Forces new resource) Creates a unique compute environment name beginning with the specified prefix. Conflicts with compute\_environment\_name. | `string` | `null` | no |
| compute\_environment\_tags | Key-value map of resource tags for the compute environment (merged with `var.tags`) | `map(string)` | `{}` | no |
| compute\_resource\_allocation\_strategy | The allocation strategy to use for the compute resource in case not enough instances of the best fitting instance type can be allocated. Valid items are BEST\_FIT\_PROGRESSIVE, SPOT\_CAPACITY\_OPTIMIZED or BEST\_FIT. | `string` | `"BEST_FIT_PROGRESSIVE"` | no |
| compute\_resource\_bid\_percentage | Integer of minimum percentage that a Spot Instance price must be when compared with the On-Demand price for that instance type before instances are launched. For example, if your bid percentage is 20% (20), then the Spot price must be below 20% of the current On-Demand price for that EC2 instance. This parameter is required for SPOT compute environments. | `number` | `null` | no |
| compute\_resource\_desired\_vcpus | The desired number of EC2 vCPUS in the compute environment. | `number` | `null` | no |
| compute\_resource\_ec2\_key\_pair | The EC2 key pair that is used for instances launched in the compute environment. | `string` | `null` | no |
| compute\_resource\_image\_id | The Amazon Machine Image (AMI) ID used for instances launched in the compute environment | `string` | `null` | no |
| compute\_resource\_instance\_type | The instances types that can be launched. You can specify instance families to launch any instance type within those families (for example, c5 or p3), or you can specify specific sizes within a family (such as c5.8xlarge). You can also choose optimal to select instance types (from the C4, M4, and R4 instance families) that match the demand of your job queues. | `list(string)` | <pre>[<br>  "c5.large"<br>]</pre> | no |
| compute\_resource\_launch\_template | Launch template configuration for compute environment format: list(object({ launch\_template\_id = string, version = optional(number) })) | `list(any)` | `[]` | no |
| compute\_resource\_max\_vcpus | The maximum number of EC2 vCPUs that an environment can reach. | `number` | `16` | no |
| compute\_resource\_min\_vcpus | The minimum number of EC2 vCPUs that an environment should maintain. | `number` | `0` | no |
| compute\_resource\_spot\_iam\_fleet\_role | (Needed for Spot if service\_role\_spot\_create == false)The Amazon Resource Name (ARN) of the Amazon EC2 Spot Fleet IAM role applied to a SPOT compute environment. This parameter is required for SPOT compute environments. | `string` | `null` | no |
| compute\_resource\_subnet\_ids | A list of VPC subnets into which the compute resources are launched | `list(string)` | n/a | yes |
| compute\_resource\_tags | Tags to be used for compute resources (merged with `var.tags`). | `map(string)` | `{}` | no |
| compute\_resource\_type | The type of compute environment. Valid items are EC2 or SPOT. | `string` | `"EC2"` | no |
| ecs\_instance\_profile\_additional\_iam\_policy\_arns | List of IAM policies ARNs to attach to ECS Instance Profile | `list(string)` | `[]` | no |
| ecs\_instance\_profile\_arn | (Needed if service\_role\_create == false) The Amazon ECS instance role applied to Amazon EC2 instances in a compute environment. | `string` | `null` | no |
| ecs\_instance\_profile\_create | Whether or not to create instance profile for ECS instances | `bool` | `true` | no |
| ecs\_instance\_profile\_name | The IAM profile's name for the EC2 instance (or launch template). If `var.ecs_instance_profile_create` is `true` and this is null, Terraform will assign a random, unique name. If `var.ecs_instance_profile_create` is `false` this value should be the name of an external IAM Instance Profile. | `string` | `"BatchEcsInstanceRole"` | no |
| ecs\_instance\_profile\_path | Path in which to create the Instance Profile for the EC2 instance (or launch template). Instance Profile IAM Role will share the same path. Ignored if `var.ecs_instance_profile_create` is `false`. | `string` | `null` | no |
| ecs\_instance\_role\_description | Description of the IAM Role to be used by the Instance Profile. Ignored if `var.ecs_instance_profile_create` is `false`. | `string` | `"Instance Profile Role For Batch Instances"` | no |
| ecs\_instance\_role\_name | Name of the IAM Role to be used by the Instance Profile. If null, Terraform will assign a random, unique name. Ignored if `var.ecs_instance_profile_create` is `false`. | `string` | `"BatchEcsInstanceRole"` | no |
| ecs\_instance\_role\_path | Path in which to create the Instance Profile for the EC2 instance (or launch template). Instance Profile IAM Role will share the same path. Ignored if `var.ecs_instance_profile_create` is `false`. | `any` | `null` | no |
| ecs\_instance\_role\_tags | Tags to be used for the Instance Profile Role (merged with `var.tags`). | `map(string)` | `{}` | no |
| instance\_sg\_create | Whether or not to create Security Group for Batch instances | `bool` | `true` | no |
| instance\_sg\_ids | (Needed if instance\_sg\_create == false) A list of EC2 security group that are associated with instances launched in the compute environment | `list(string)` | `[]` | no |
| instance\_sg\_name | SG name for Batch instances | `string` | `"SG for Batch instances"` | no |
| instance\_sg\_tags | Tags to be used for the instances SG (merged with `var.tags`). | `map(string)` | `{}` | no |
| prefix | Prefix to be added to with all resource's names of the module. Prefix is mainly used for tests and should remain empty in normal circumstances. | `string` | `""` | no |
| queue\_create | Whether or not to create a job queue for Batch | `bool` | `true` | no |
| queue\_enabled | Whether or not to enable job queue (toggles aws\_batch\_job\_queue.state ENABLED/DISABLED).) | `bool` | `true` | no |
| queue\_name | Specifies the name of the job queue. | `string` | `"job-queue"` | no |
| queue\_priority | The priority of the job queue. Job queues with a higher priority are evaluated first when associated with the same compute environment. | `number` | `1` | no |
| queue\_tags | Tags to be used for the job queue (merged with `var.tags`). | `map(string)` | `{}` | no |
| service\_linked\_role\_spot\_create | Whether or not to create service role for Spot | `bool` | `true` | no |
| service\_linked\_role\_spot\_description | Description attached to the service linked role | `string` | `"Spot service linked role"` | no |
| service\_linked\_role\_spotfleet\_create | Whether or not to create service role for Spot | `bool` | `true` | no |
| service\_linked\_role\_spotfleet\_description | Description attached to the service linked role | `string` | `"Spotfleet service linked role"` | no |
| service\_role\_arn | (Needed if service\_role\_create == false) Full Amazon Resource Name (ARN) of the IAM role that allows AWS Batch to make calls to other AWS services on your behalf. | `string` | `null` | no |
| service\_role\_create | Whether or not to create service role for Batch | `bool` | `true` | no |
| service\_role\_description | Description of the IAM Role to be used by the Batch. Ignored if `var.service_role_create` is `false`. | `string` | `"Service Role For Batch"` | no |
| service\_role\_name | Instance role name for ECS instances | `string` | `"BatchServiceRoleEC2"` | no |
| service\_role\_path | Path in which to create the service role for Batch. Ignored if `var.service_role_create` is `false`. | `string` | `null` | no |
| service\_role\_spot\_create | Whether or not to create service role for Spot | `bool` | `true` | no |
| service\_role\_spot\_description | Description of the IAM Role to be used by the Batch. Ignored if `var.service_role_spot_create` is `false`. | `string` | `"Service Role Spot For Batch"` | no |
| service\_role\_spot\_name | Instance role name for ECS instances | `string` | `"AmazonEC2SpotFleetTaggingRole"` | no |
| service\_role\_spot\_path | Path in which to create the service role for Batch. Ignored if `var.service_role_spot_create` is `false`. | `string` | `null` | no |
| tags | Map of tags that will be applied on all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| batch\_compute\_environment\_arn | The Amazon Resource Name (ARN) of the compute environment. |
| batch\_compute\_environment\_ecs\_cluster\_arn | The Amazon Resource Name (ARN) of the underlying Amazon ECS cluster used by the compute environment. |
| batch\_compute\_environment\_status | The current status of the compute environment (for example, CREATING or VALID). |
| batch\_compute\_environment\_status\_reason | A short, human-readable string to provide additional details about the current status of the compute environment. |
| batch\_job\_queue\_this\_arn | The Amazon Resource Name of the job queue. |
| iam\_instance\_profile\_ecs\_instance\_role\_arn | The ARN assigned by AWS to the instance profile. |
| iam\_instance\_profile\_ecs\_instance\_role\_create\_date | The creation timestamp of the instance profile. |
| iam\_instance\_profile\_ecs\_instance\_role\_id | The instance profile's ID. |
| iam\_instance\_profile\_ecs\_instance\_role\_name | The instance profile's name. |
| iam\_instance\_profile\_ecs\_instance\_role\_path | The path of the instance profile in IAM. |
| iam\_instance\_profile\_ecs\_instance\_role\_role | The role assigned to the instance profile. |
| iam\_instance\_profile\_ecs\_instance\_role\_unique\_id | The unique ID assigned by AWS. |
| iam\_role\_ecs\_instance\_role\_arn | The Amazon Resource Name (ARN) specifying the role. |
| iam\_role\_ecs\_instance\_role\_create\_date | The creation date of the IAM role. |
| iam\_role\_ecs\_instance\_role\_description | The description of the role. |
| iam\_role\_ecs\_instance\_role\_id | The name of the role. |
| iam\_role\_ecs\_instance\_role\_name | The name of the role. |
| iam\_role\_ecs\_instance\_role\_unique\_id | The stable and unique string identifying the role. |
| iam\_role\_service\_role\_arn | The Amazon Resource Name (ARN) specifying the role. |
| iam\_role\_service\_role\_create\_date | The creation date of the IAM role. |
| iam\_role\_service\_role\_description | The description of the role. |
| iam\_role\_service\_role\_id | The name of the role. |
| iam\_role\_service\_role\_name | The name of the role. |
| iam\_role\_service\_role\_spot\_arn | The Amazon Resource Name (ARN) specifying the role. |
| iam\_role\_service\_role\_spot\_create\_date | The creation date of the IAM role. |
| iam\_role\_service\_role\_spot\_description | The description of the role. |
| iam\_role\_service\_role\_spot\_id | The name of the role. |
| iam\_role\_service\_role\_spot\_name | The name of the role. |
| iam\_role\_service\_role\_spot\_unique\_id | The stable and unique string identifying the role. |
| iam\_role\_service\_role\_unique\_id | The stable and unique string identifying the role. |
| security\_group\_instances\_arn | The ARN of the security group. |
| security\_group\_instances\_description | The description of the security group. |
| security\_group\_instances\_egress | The egress rules. |
| security\_group\_instances\_id | The ID of the security group. |
| security\_group\_instances\_ingress | The ingress rules. |
| security\_group\_instances\_name | The name of the security group. |
| security\_group\_instances\_owner\_id | The owner ID. |
| security\_group\_instances\_vpc\_id | The VPC ID. |
| service\_linked\_role\_spot\_arn | The Amazon Resource Name (ARN) specifying the role. |
| service\_linked\_role\_spot\_id | The Amazon Resource Name (ARN) of the role. |
| service\_linked\_role\_spot\_name | The name of the role. |
| service\_linked\_role\_spot\_path | The path of the role. |
| service\_linked\_role\_spot\_unique\_id | The stable and unique string identifying the role. |
| service\_linked\_role\_spotfleet\_arn | The Amazon Resource Name (ARN) specifying the role. |
| service\_linked\_role\_spotfleet\_id | The Amazon Resource Name (ARN) of the role. |
| service\_linked\_role\_spotfleet\_name | The name of the role. |
| service\_linked\_role\_spotfleet\_path | The path of the role. |
| service\_linked\_role\_spotfleet\_unique\_id | The stable and unique string identifying the role. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
