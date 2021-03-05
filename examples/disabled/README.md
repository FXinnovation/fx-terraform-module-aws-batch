# Default example

## Usage

```
# terraform init
# terraform apply
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.0 |
| random | >= 3.0 |

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| disabled | ../../ |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | Credentials: AWS access key. | `string` | n/a | yes |
| secret\_key | Credentials: AWS secret key. Pass this as a variable, never write password in the code. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| batch\_compute\_environment\_arn | n/a |
| batch\_compute\_environment\_ecs\_cluster\_arn | n/a |
| batch\_compute\_environment\_status | n/a |
| batch\_compute\_environment\_status\_reason | n/a |
| batch\_job\_queue\_this\_arn | n/a |
| iam\_instance\_profile\_ecs\_instance\_role\_arn | n/a |
| iam\_instance\_profile\_ecs\_instance\_role\_create\_date | n/a |
| iam\_instance\_profile\_ecs\_instance\_role\_id | n/a |
| iam\_instance\_profile\_ecs\_instance\_role\_name | n/a |
| iam\_instance\_profile\_ecs\_instance\_role\_path | n/a |
| iam\_instance\_profile\_ecs\_instance\_role\_role | n/a |
| iam\_instance\_profile\_ecs\_instance\_role\_unique\_id | n/a |
| iam\_role\_ecs\_instance\_role\_arn | n/a |
| iam\_role\_ecs\_instance\_role\_create\_date | n/a |
| iam\_role\_ecs\_instance\_role\_description | n/a |
| iam\_role\_ecs\_instance\_role\_id | n/a |
| iam\_role\_ecs\_instance\_role\_name | n/a |
| iam\_role\_ecs\_instance\_role\_unique\_id | n/a |
| iam\_role\_service\_role\_arn | n/a |
| iam\_role\_service\_role\_create\_date | n/a |
| iam\_role\_service\_role\_description | n/a |
| iam\_role\_service\_role\_id | n/a |
| iam\_role\_service\_role\_name | n/a |
| iam\_role\_service\_role\_spot\_arn | n/a |
| iam\_role\_service\_role\_spot\_create\_date | n/a |
| iam\_role\_service\_role\_spot\_description | n/a |
| iam\_role\_service\_role\_spot\_id | n/a |
| iam\_role\_service\_role\_spot\_name | n/a |
| iam\_role\_service\_role\_spot\_unique\_id | n/a |
| iam\_role\_service\_role\_unique\_id | n/a |
| security\_group\_instances\_arn | n/a |
| security\_group\_instances\_description | n/a |
| security\_group\_instances\_egress | n/a |
| security\_group\_instances\_id | n/a |
| security\_group\_instances\_ingress | n/a |
| security\_group\_instances\_name | n/a |
| security\_group\_instances\_owner\_id | n/a |
| security\_group\_instances\_vpc\_id | n/a |
| service\_linked\_role\_spot\_arn | n/a |
| service\_linked\_role\_spot\_id | n/a |
| service\_linked\_role\_spot\_name | n/a |
| service\_linked\_role\_spot\_path | n/a |
| service\_linked\_role\_spot\_unique\_id | n/a |
| service\_linked\_role\_spotfleet\_arn | n/a |
| service\_linked\_role\_spotfleet\_id | n/a |
| service\_linked\_role\_spotfleet\_name | n/a |
| service\_linked\_role\_spotfleet\_path | n/a |
| service\_linked\_role\_spotfleet\_unique\_id | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
