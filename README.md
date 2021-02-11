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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| compute\_environment\_arns | (Needed if compute\_environment\_create == false) Specifies the set of compute environments (ARNs) mapped to a job queue and their order. The position of the compute environments in the list will dictate the order. You can associate up to 3 compute environments with a job queue | `list(string)` | `[]` | no |
| compute\_environment\_create | Whether or not to create a compute environment for Batch | `bool` | `true` | no |
| compute\_environment\_name | (Optional, Forces new resource) The name for your compute environment. Up to 128 letters (uppercase and lowercase), numbers, hyphens and underscores are allowed. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| compute\_environment\_name\_prefix | (Optional, Forces new resource) Creates a unique compute environment name beginning with the specified prefix. Conflicts with compute\_environment\_name. | `string` | `null` | no |
| compute\_environment\_state | The state of the compute environment. If the state is ENABLED, then the compute environment accepts jobs from a queue and can scale out automatically based on queues. Valid items are ENABLED or DISABLED. | `string` | `"ENABLED"` | no |
| compute\_environment\_tags | Key-value map of resource tags for the compute environment (merged with `var.tags`) | `map` | `{}` | no |
| compute\_environment\_type | The type of the compute environment. Valid items are MANAGED or UNMANAGED. | `string` | `"MANAGED"` | no |
| compute\_resource\_allocation\_strategy | The allocation strategy to use for the compute resource in case not enough instances of the best fitting instance type can be allocated. Valid items are BEST\_FIT\_PROGRESSIVE, SPOT\_CAPACITY\_OPTIMIZED or BEST\_FIT. Defaults to BEST\_FIT. See AWS docs for details. | `string` | `"BEST_FIT_PROGRESSIVE"` | no |
| compute\_resource\_bid\_percentage | Integer of minimum percentage that a Spot Instance price must be when compared with the On-Demand price for that instance type before instances are launched. For example, if your bid percentage is 20% (20), then the Spot price must be below 20% of the current On-Demand price for that EC2 instance. This parameter is required for SPOT compute environments. | `number` | `null` | no |
| compute\_resource\_desired\_vcpus | The desired number of EC2 vCPUS in the compute environment. | `number` | `null` | no |
| compute\_resource\_ec2\_key\_pair | The EC2 key pair that is used for instances launched in the compute environment. | `string` | `null` | no |
| compute\_resource\_image\_id | The Amazon Machine Image (AMI) ID used for instances launched in the compute environment | `string` | `null` | no |
| compute\_resource\_instance\_type | A list of instance types that may be launched | `list(string)` | <pre>[<br>  "c5.large"<br>]</pre> | no |
| compute\_resource\_launch\_template | Launch template configuration for compute environment | `list(any)` | `[]` | no |
| compute\_resource\_max\_vcpus | The maximum number of EC2 vCPUs that an environment can reach. | `number` | `16` | no |
| compute\_resource\_min\_vcpus | The minimum number of EC2 vCPUs that an environment should maintain. | `number` | `0` | no |
| compute\_resource\_spot\_iam\_fleet\_role | (Needed for Spot if service\_role\_spot\_create == false)The Amazon Resource Name (ARN) of the Amazon EC2 Spot Fleet IAM role applied to a SPOT compute environment. This parameter is required for SPOT compute environments. | `string` | `null` | no |
| compute\_resource\_subnet\_ids | A list of VPC subnets into which the compute resources are launched | `list(string)` | n/a | yes |
| compute\_resource\_tags | Tags to be used for compute resources (merged with `var.tags`). | `map` | `{}` | no |
| compute\_resource\_type | The type of compute environment. Valid items are EC2 or SPOT. | `string` | `"EC2"` | no |
| ecs\_instance\_profile\_arn | (Needed if service\_role\_create == false) The Amazon ECS instance role applied to Amazon EC2 instances in a compute environment. | `string` | `"BatchEcsInstanceRole"` | no |
| ecs\_instance\_profile\_create | Whether or not to create instance profile for ECS instances | `bool` | `true` | no |
| ecs\_instance\_profile\_name | The IAM profile's name for the EC2 instance (or launch template). If `var.ecs_instance_profile_create` is `true` and this is null, Terraform will assign a random, unique name. If `var.ecs_instance_profile_create` is `false` this value should be the name of an external IAM Instance Profile. | `string` | `"batch_ecs_instance_role"` | no |
| ecs\_instance\_profile\_path | Path in which to create the Instance Profile for the EC2 instance (or launch template). Instance Profile IAM Role will share the same path. Ignored if `var.ecs_instance_profile_create` is `false`. | `string` | `null` | no |
| ecs\_instance\_role\_description | Description of the IAM Role to be used by the Instance Profile. Ignored if `var.ecs_instance_profile_create` is `false`. | `string` | `"Instance Profile Role For Batch Instances"` | no |
| ecs\_instance\_role\_name | Name of the IAM Role to be used by the Instance Profile. If null, Terraform will assign a random, unique name. Ignored if `var.ecs_instance_profile_create` is `false`. | `string` | `"BatchEcsInstanceRole"` | no |
| ecs\_instance\_role\_path | Path in which to create the Instance Profile for the EC2 instance (or launch template). Instance Profile IAM Role will share the same path. Ignored if `var.ecs_instance_profile_create` is `false`. | `any` | `null` | no |
| ecs\_instance\_role\_tags | Tags to be used for the Instance Profile Role (merged with `var.tags`). | `map` | `{}` | no |
| instance\_sg\_create | Whether or not to create Security Group for Batch instances | `bool` | `true` | no |
| instance\_sg\_ids | (Needed if instance\_sg\_create == false) A list of EC2 security group that are associated with instances launched in the compute environment | `list(string)` | `[]` | no |
| instance\_sg\_name | Instance role name for ECS instances | `string` | `"BatchServiceRole"` | no |
| instance\_sg\_tags | Tags to be used for the instances SG (merged with `var.tags`). | `map` | `{}` | no |
| prefix | Prefix to be added to with all resource's names of the module. Prefix is mainly used for tests and should remain empty in normal circumstances. | `string` | `""` | no |
| queue\_create | Whether or not to create a job queue for Batch | `bool` | `true` | no |
| queue\_name | Specifies the name of the job queue. | `string` | `"job-queue"` | no |
| queue\_priority | The priority of the job queue. Job queues with a higher priority are evaluated first when associated with the same compute environment. | `number` | `1` | no |
| queue\_state | The state of the job queue. Must be one of: ENABLED or DISABLED | `string` | `"ENABLED"` | no |
| queue\_tags | Tags to be used for the job queue (merged with `var.tags`). | `map` | `{}` | no |
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
| service\_role\_spot\_name | Instance role name for ECS instances | `string` | `"AmazonEC2SpotFleetRole"` | no |
| service\_role\_spot\_path | Path in which to create the service role for Batch. Ignored if `var.service_role_spot_create` is `false`. | `string` | `null` | no |
| tags | Map of tags that will be applied on all resources. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_batch\_compute\_environment\_arn | The Amazon Resource Name (ARN) of the compute environment. |
| aws\_batch\_compute\_environment\_ecs\_cluster\_arn | The Amazon Resource Name (ARN) of the underlying Amazon ECS cluster used by the compute environment. |
| aws\_batch\_compute\_environment\_status | The current status of the compute environment (for example, CREATING or VALID). |
| aws\_batch\_compute\_environment\_status\_reason | A short, human-readable string to provide additional details about the current status of the compute environment. |
| aws\_batch\_job\_queue\_this\_arn | The Amazon Resource Name of the job queue. |
| aws\_iam\_instance\_profile\_ecs\_instance\_role\_arn | The ARN assigned by AWS to the instance profile. |
| aws\_iam\_instance\_profile\_ecs\_instance\_role\_create\_date | The creation timestamp of the instance profile. |
| aws\_iam\_instance\_profile\_ecs\_instance\_role\_id | The instance profile's ID. |
| aws\_iam\_instance\_profile\_ecs\_instance\_role\_name | The instance profile's name. |
| aws\_iam\_instance\_profile\_ecs\_instance\_role\_path | The path of the instance profile in IAM. |
| aws\_iam\_instance\_profile\_ecs\_instance\_role\_role | The role assigned to the instance profile. |
| aws\_iam\_instance\_profile\_ecs\_instance\_role\_unique\_id | The unique ID assigned by AWS. |
| aws\_iam\_role\_ecs\_instance\_role\_arn | The Amazon Resource Name (ARN) specifying the role. |
| aws\_iam\_role\_ecs\_instance\_role\_create\_date | The creation date of the IAM role. |
| aws\_iam\_role\_ecs\_instance\_role\_description | The description of the role. |
| aws\_iam\_role\_ecs\_instance\_role\_id | The name of the role. |
| aws\_iam\_role\_ecs\_instance\_role\_name | The name of the role. |
| aws\_iam\_role\_ecs\_instance\_role\_unique\_id | The stable and unique string identifying the role. |
| aws\_iam\_role\_service\_role\_arn | The Amazon Resource Name (ARN) specifying the role. |
| aws\_iam\_role\_service\_role\_create\_date | The creation date of the IAM role. |
| aws\_iam\_role\_service\_role\_description | The description of the role. |
| aws\_iam\_role\_service\_role\_id | The name of the role. |
| aws\_iam\_role\_service\_role\_name | The name of the role. |
| aws\_iam\_role\_service\_role\_spot\_arn | The Amazon Resource Name (ARN) specifying the role. |
| aws\_iam\_role\_service\_role\_spot\_create\_date | The creation date of the IAM role. |
| aws\_iam\_role\_service\_role\_spot\_description | The description of the role. |
| aws\_iam\_role\_service\_role\_spot\_id | The name of the role. |
| aws\_iam\_role\_service\_role\_spot\_name | The name of the role. |
| aws\_iam\_role\_service\_role\_spot\_unique\_id | The stable and unique string identifying the role. |
| aws\_iam\_role\_service\_role\_unique\_id | The stable and unique string identifying the role. |
| aws\_security\_group\_instances\_arn | The ARN of the security group. |
| aws\_security\_group\_instances\_description | The description of the security group. |
| aws\_security\_group\_instances\_egress | The egress rules. |
| aws\_security\_group\_instances\_id | The ID of the security group. |
| aws\_security\_group\_instances\_ingress | The ingress rules. |
| aws\_security\_group\_instances\_name | The name of the security group. |
| aws\_security\_group\_instances\_owner\_id | The owner ID. |
| aws\_security\_group\_instances\_vpc\_id | The VPC ID. |
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
