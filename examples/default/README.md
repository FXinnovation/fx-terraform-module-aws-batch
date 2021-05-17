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
| tls | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |
| random | >= 3.0 |
| tls | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| default | ../../ |  |
| extraenvspot | ../../ |  |
| extraenvspot2 | ../../ |  |
| extrajqueue | ../../ |  |

## Resources

| Name |
|------|
| [aws_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) |
| [aws_launch_template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) |
| [aws_subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) |
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) |
| [random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) |
| [tls_private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | Credentials: AWS access key. | `string` | n/a | yes |
| secret\_key | Credentials: AWS secret key. Pass this as a variable, never write password in the code. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| default\_batch\_compute\_environment\_arn | n/a |
| default\_batch\_compute\_environment\_ecs\_cluster\_arn | n/a |
| default\_batch\_compute\_environment\_status | n/a |
| default\_batch\_compute\_environment\_status\_reason | n/a |
| default\_batch\_job\_queue\_this\_arn | n/a |
| default\_iam\_instance\_profile\_ecs\_instance\_role\_arn | n/a |
| default\_iam\_instance\_profile\_ecs\_instance\_role\_create\_date | n/a |
| default\_iam\_instance\_profile\_ecs\_instance\_role\_id | n/a |
| default\_iam\_instance\_profile\_ecs\_instance\_role\_name | n/a |
| default\_iam\_instance\_profile\_ecs\_instance\_role\_path | n/a |
| default\_iam\_instance\_profile\_ecs\_instance\_role\_role | n/a |
| default\_iam\_instance\_profile\_ecs\_instance\_role\_unique\_id | n/a |
| default\_iam\_role\_ecs\_instance\_role\_arn | n/a |
| default\_iam\_role\_ecs\_instance\_role\_create\_date | n/a |
| default\_iam\_role\_ecs\_instance\_role\_description | n/a |
| default\_iam\_role\_ecs\_instance\_role\_id | n/a |
| default\_iam\_role\_ecs\_instance\_role\_name | n/a |
| default\_iam\_role\_ecs\_instance\_role\_unique\_id | n/a |
| default\_iam\_role\_service\_role\_arn | n/a |
| default\_iam\_role\_service\_role\_create\_date | n/a |
| default\_iam\_role\_service\_role\_description | n/a |
| default\_iam\_role\_service\_role\_id | n/a |
| default\_iam\_role\_service\_role\_name | n/a |
| default\_iam\_role\_service\_role\_spot\_arn | n/a |
| default\_iam\_role\_service\_role\_spot\_create\_date | n/a |
| default\_iam\_role\_service\_role\_spot\_description | n/a |
| default\_iam\_role\_service\_role\_spot\_id | n/a |
| default\_iam\_role\_service\_role\_spot\_name | n/a |
| default\_iam\_role\_service\_role\_spot\_unique\_id | n/a |
| default\_iam\_role\_service\_role\_unique\_id | n/a |
| default\_security\_group\_instances\_arn | n/a |
| default\_security\_group\_instances\_description | n/a |
| default\_security\_group\_instances\_egress | n/a |
| default\_security\_group\_instances\_id | n/a |
| default\_security\_group\_instances\_ingress | n/a |
| default\_security\_group\_instances\_name | n/a |
| default\_security\_group\_instances\_owner\_id | n/a |
| default\_security\_group\_instances\_vpc\_id | n/a |
| default\_service\_linked\_role\_spot\_arn | n/a |
| default\_service\_linked\_role\_spot\_id | n/a |
| default\_service\_linked\_role\_spot\_name | n/a |
| default\_service\_linked\_role\_spot\_path | n/a |
| default\_service\_linked\_role\_spot\_unique\_id | n/a |
| default\_service\_linked\_role\_spotfleet\_arn | n/a |
| default\_service\_linked\_role\_spotfleet\_id | n/a |
| default\_service\_linked\_role\_spotfleet\_name | n/a |
| default\_service\_linked\_role\_spotfleet\_path | n/a |
| default\_service\_linked\_role\_spotfleet\_unique\_id | n/a |
| extraenvspot\_batch\_compute\_environment\_arn | n/a |
| extraenvspot\_batch\_compute\_environment\_ecs\_cluster\_arn | n/a |
| extraenvspot\_batch\_compute\_environment\_status | n/a |
| extraenvspot\_batch\_compute\_environment\_status\_reason | n/a |
| extraenvspot\_batch\_job\_queue\_this\_arn | n/a |
| extraenvspot\_iam\_instance\_profile\_ecs\_instance\_role\_arn | n/a |
| extraenvspot\_iam\_instance\_profile\_ecs\_instance\_role\_create\_date | n/a |
| extraenvspot\_iam\_instance\_profile\_ecs\_instance\_role\_id | n/a |
| extraenvspot\_iam\_instance\_profile\_ecs\_instance\_role\_name | n/a |
| extraenvspot\_iam\_instance\_profile\_ecs\_instance\_role\_path | n/a |
| extraenvspot\_iam\_instance\_profile\_ecs\_instance\_role\_role | n/a |
| extraenvspot\_iam\_instance\_profile\_ecs\_instance\_role\_unique\_id | n/a |
| extraenvspot\_iam\_role\_ecs\_instance\_role\_arn | n/a |
| extraenvspot\_iam\_role\_ecs\_instance\_role\_create\_date | n/a |
| extraenvspot\_iam\_role\_ecs\_instance\_role\_description | n/a |
| extraenvspot\_iam\_role\_ecs\_instance\_role\_id | n/a |
| extraenvspot\_iam\_role\_ecs\_instance\_role\_name | n/a |
| extraenvspot\_iam\_role\_ecs\_instance\_role\_unique\_id | n/a |
| extraenvspot\_iam\_role\_service\_role\_arn | n/a |
| extraenvspot\_iam\_role\_service\_role\_create\_date | n/a |
| extraenvspot\_iam\_role\_service\_role\_description | n/a |
| extraenvspot\_iam\_role\_service\_role\_id | n/a |
| extraenvspot\_iam\_role\_service\_role\_name | n/a |
| extraenvspot\_iam\_role\_service\_role\_spot\_arn | n/a |
| extraenvspot\_iam\_role\_service\_role\_spot\_create\_date | n/a |
| extraenvspot\_iam\_role\_service\_role\_spot\_description | n/a |
| extraenvspot\_iam\_role\_service\_role\_spot\_id | n/a |
| extraenvspot\_iam\_role\_service\_role\_spot\_name | n/a |
| extraenvspot\_iam\_role\_service\_role\_spot\_unique\_id | n/a |
| extraenvspot\_iam\_role\_service\_role\_unique\_id | n/a |
| extraenvspot\_security\_group\_instances\_arn | n/a |
| extraenvspot\_security\_group\_instances\_description | n/a |
| extraenvspot\_security\_group\_instances\_egress | n/a |
| extraenvspot\_security\_group\_instances\_id | n/a |
| extraenvspot\_security\_group\_instances\_ingress | n/a |
| extraenvspot\_security\_group\_instances\_name | n/a |
| extraenvspot\_security\_group\_instances\_owner\_id | n/a |
| extraenvspot\_security\_group\_instances\_vpc\_id | n/a |
| extraenvspot\_service\_linked\_role\_spot\_arn | n/a |
| extraenvspot\_service\_linked\_role\_spot\_id | n/a |
| extraenvspot\_service\_linked\_role\_spot\_name | n/a |
| extraenvspot\_service\_linked\_role\_spot\_path | n/a |
| extraenvspot\_service\_linked\_role\_spot\_unique\_id | n/a |
| extraenvspot\_service\_linked\_role\_spotfleet\_arn | n/a |
| extraenvspot\_service\_linked\_role\_spotfleet\_id | n/a |
| extraenvspot\_service\_linked\_role\_spotfleet\_name | n/a |
| extraenvspot\_service\_linked\_role\_spotfleet\_path | n/a |
| extraenvspot\_service\_linked\_role\_spotfleet\_unique\_id | n/a |
| extrajqueue\_batch\_compute\_environment\_arn | n/a |
| extrajqueue\_batch\_compute\_environment\_ecs\_cluster\_arn | n/a |
| extrajqueue\_batch\_compute\_environment\_status | n/a |
| extrajqueue\_batch\_compute\_environment\_status\_reason | n/a |
| extrajqueue\_batch\_job\_queue\_this\_arn | n/a |
| extrajqueue\_iam\_instance\_profile\_ecs\_instance\_role\_arn | n/a |
| extrajqueue\_iam\_instance\_profile\_ecs\_instance\_role\_create\_date | n/a |
| extrajqueue\_iam\_instance\_profile\_ecs\_instance\_role\_id | n/a |
| extrajqueue\_iam\_instance\_profile\_ecs\_instance\_role\_name | n/a |
| extrajqueue\_iam\_instance\_profile\_ecs\_instance\_role\_path | n/a |
| extrajqueue\_iam\_instance\_profile\_ecs\_instance\_role\_role | n/a |
| extrajqueue\_iam\_instance\_profile\_ecs\_instance\_role\_unique\_id | n/a |
| extrajqueue\_iam\_role\_ecs\_instance\_role\_arn | n/a |
| extrajqueue\_iam\_role\_ecs\_instance\_role\_create\_date | n/a |
| extrajqueue\_iam\_role\_ecs\_instance\_role\_description | n/a |
| extrajqueue\_iam\_role\_ecs\_instance\_role\_id | n/a |
| extrajqueue\_iam\_role\_ecs\_instance\_role\_name | n/a |
| extrajqueue\_iam\_role\_ecs\_instance\_role\_unique\_id | n/a |
| extrajqueue\_iam\_role\_service\_role\_arn | n/a |
| extrajqueue\_iam\_role\_service\_role\_create\_date | n/a |
| extrajqueue\_iam\_role\_service\_role\_description | n/a |
| extrajqueue\_iam\_role\_service\_role\_id | n/a |
| extrajqueue\_iam\_role\_service\_role\_name | n/a |
| extrajqueue\_iam\_role\_service\_role\_spot\_arn | n/a |
| extrajqueue\_iam\_role\_service\_role\_spot\_create\_date | n/a |
| extrajqueue\_iam\_role\_service\_role\_spot\_description | n/a |
| extrajqueue\_iam\_role\_service\_role\_spot\_id | n/a |
| extrajqueue\_iam\_role\_service\_role\_spot\_name | n/a |
| extrajqueue\_iam\_role\_service\_role\_spot\_unique\_id | n/a |
| extrajqueue\_iam\_role\_service\_role\_unique\_id | n/a |
| extrajqueue\_security\_group\_instances\_arn | n/a |
| extrajqueue\_security\_group\_instances\_description | n/a |
| extrajqueue\_security\_group\_instances\_egress | n/a |
| extrajqueue\_security\_group\_instances\_id | n/a |
| extrajqueue\_security\_group\_instances\_ingress | n/a |
| extrajqueue\_security\_group\_instances\_name | n/a |
| extrajqueue\_security\_group\_instances\_owner\_id | n/a |
| extrajqueue\_security\_group\_instances\_vpc\_id | n/a |
| extrajqueue\_service\_linked\_role\_spot\_arn | n/a |
| extrajqueue\_service\_linked\_role\_spot\_id | n/a |
| extrajqueue\_service\_linked\_role\_spot\_name | n/a |
| extrajqueue\_service\_linked\_role\_spot\_path | n/a |
| extrajqueue\_service\_linked\_role\_spot\_unique\_id | n/a |
| extrajqueue\_service\_linked\_role\_spotfleet\_arn | n/a |
| extrajqueue\_service\_linked\_role\_spotfleet\_id | n/a |
| extrajqueue\_service\_linked\_role\_spotfleet\_name | n/a |
| extrajqueue\_service\_linked\_role\_spotfleet\_path | n/a |
| extrajqueue\_service\_linked\_role\_spotfleet\_unique\_id | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
