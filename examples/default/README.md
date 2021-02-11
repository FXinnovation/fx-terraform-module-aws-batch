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

| Name | Version |
|------|---------|
| aws | >= 3.0 |
| random | >= 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | Credentials: AWS access key. | `string` | n/a | yes |
| secret\_key | Credentials: AWS secret key. Pass this as a variable, never write password in the code. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| default\_aws\_batch\_compute\_environment\_arn | n/a |
| default\_aws\_batch\_compute\_environment\_ecs\_cluster\_arn | n/a |
| default\_aws\_batch\_compute\_environment\_status | n/a |
| default\_aws\_batch\_compute\_environment\_status\_reason | n/a |
| default\_aws\_batch\_job\_queue\_this\_arn | n/a |
| default\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_arn | n/a |
| default\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_create\_date | n/a |
| default\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_id | n/a |
| default\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_name | n/a |
| default\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_path | n/a |
| default\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_role | n/a |
| default\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_unique\_id | n/a |
| default\_aws\_iam\_role\_ecs\_instance\_role\_arn | n/a |
| default\_aws\_iam\_role\_ecs\_instance\_role\_create\_date | n/a |
| default\_aws\_iam\_role\_ecs\_instance\_role\_description | n/a |
| default\_aws\_iam\_role\_ecs\_instance\_role\_id | n/a |
| default\_aws\_iam\_role\_ecs\_instance\_role\_name | n/a |
| default\_aws\_iam\_role\_ecs\_instance\_role\_unique\_id | n/a |
| default\_aws\_iam\_role\_service\_role\_arn | n/a |
| default\_aws\_iam\_role\_service\_role\_create\_date | n/a |
| default\_aws\_iam\_role\_service\_role\_description | n/a |
| default\_aws\_iam\_role\_service\_role\_id | n/a |
| default\_aws\_iam\_role\_service\_role\_name | n/a |
| default\_aws\_iam\_role\_service\_role\_spot\_arn | n/a |
| default\_aws\_iam\_role\_service\_role\_spot\_create\_date | n/a |
| default\_aws\_iam\_role\_service\_role\_spot\_description | n/a |
| default\_aws\_iam\_role\_service\_role\_spot\_id | n/a |
| default\_aws\_iam\_role\_service\_role\_spot\_name | n/a |
| default\_aws\_iam\_role\_service\_role\_spot\_unique\_id | n/a |
| default\_aws\_iam\_role\_service\_role\_unique\_id | n/a |
| default\_aws\_security\_group\_instances\_arn | n/a |
| default\_aws\_security\_group\_instances\_description | n/a |
| default\_aws\_security\_group\_instances\_egress | n/a |
| default\_aws\_security\_group\_instances\_id | n/a |
| default\_aws\_security\_group\_instances\_ingress | n/a |
| default\_aws\_security\_group\_instances\_name | n/a |
| default\_aws\_security\_group\_instances\_owner\_id | n/a |
| default\_aws\_security\_group\_instances\_vpc\_id | n/a |
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
| extraenvspot\_aws\_batch\_compute\_environment\_arn | n/a |
| extraenvspot\_aws\_batch\_compute\_environment\_ecs\_cluster\_arn | n/a |
| extraenvspot\_aws\_batch\_compute\_environment\_status | n/a |
| extraenvspot\_aws\_batch\_compute\_environment\_status\_reason | n/a |
| extraenvspot\_aws\_batch\_job\_queue\_this\_arn | n/a |
| extraenvspot\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_arn | n/a |
| extraenvspot\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_create\_date | n/a |
| extraenvspot\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_id | n/a |
| extraenvspot\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_name | n/a |
| extraenvspot\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_path | n/a |
| extraenvspot\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_role | n/a |
| extraenvspot\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_unique\_id | n/a |
| extraenvspot\_aws\_iam\_role\_ecs\_instance\_role\_arn | n/a |
| extraenvspot\_aws\_iam\_role\_ecs\_instance\_role\_create\_date | n/a |
| extraenvspot\_aws\_iam\_role\_ecs\_instance\_role\_description | n/a |
| extraenvspot\_aws\_iam\_role\_ecs\_instance\_role\_id | n/a |
| extraenvspot\_aws\_iam\_role\_ecs\_instance\_role\_name | n/a |
| extraenvspot\_aws\_iam\_role\_ecs\_instance\_role\_unique\_id | n/a |
| extraenvspot\_aws\_iam\_role\_service\_role\_arn | n/a |
| extraenvspot\_aws\_iam\_role\_service\_role\_create\_date | n/a |
| extraenvspot\_aws\_iam\_role\_service\_role\_description | n/a |
| extraenvspot\_aws\_iam\_role\_service\_role\_id | n/a |
| extraenvspot\_aws\_iam\_role\_service\_role\_name | n/a |
| extraenvspot\_aws\_iam\_role\_service\_role\_spot\_arn | n/a |
| extraenvspot\_aws\_iam\_role\_service\_role\_spot\_create\_date | n/a |
| extraenvspot\_aws\_iam\_role\_service\_role\_spot\_description | n/a |
| extraenvspot\_aws\_iam\_role\_service\_role\_spot\_id | n/a |
| extraenvspot\_aws\_iam\_role\_service\_role\_spot\_name | n/a |
| extraenvspot\_aws\_iam\_role\_service\_role\_spot\_unique\_id | n/a |
| extraenvspot\_aws\_iam\_role\_service\_role\_unique\_id | n/a |
| extraenvspot\_aws\_security\_group\_instances\_arn | n/a |
| extraenvspot\_aws\_security\_group\_instances\_description | n/a |
| extraenvspot\_aws\_security\_group\_instances\_egress | n/a |
| extraenvspot\_aws\_security\_group\_instances\_id | n/a |
| extraenvspot\_aws\_security\_group\_instances\_ingress | n/a |
| extraenvspot\_aws\_security\_group\_instances\_name | n/a |
| extraenvspot\_aws\_security\_group\_instances\_owner\_id | n/a |
| extraenvspot\_aws\_security\_group\_instances\_vpc\_id | n/a |
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
| extrajqueue\_aws\_batch\_compute\_environment\_arn | n/a |
| extrajqueue\_aws\_batch\_compute\_environment\_ecs\_cluster\_arn | n/a |
| extrajqueue\_aws\_batch\_compute\_environment\_status | n/a |
| extrajqueue\_aws\_batch\_compute\_environment\_status\_reason | n/a |
| extrajqueue\_aws\_batch\_job\_queue\_this\_arn | n/a |
| extrajqueue\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_arn | n/a |
| extrajqueue\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_create\_date | n/a |
| extrajqueue\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_id | n/a |
| extrajqueue\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_name | n/a |
| extrajqueue\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_path | n/a |
| extrajqueue\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_role | n/a |
| extrajqueue\_aws\_iam\_instance\_profile\_ecs\_instance\_role\_unique\_id | n/a |
| extrajqueue\_aws\_iam\_role\_ecs\_instance\_role\_arn | n/a |
| extrajqueue\_aws\_iam\_role\_ecs\_instance\_role\_create\_date | n/a |
| extrajqueue\_aws\_iam\_role\_ecs\_instance\_role\_description | n/a |
| extrajqueue\_aws\_iam\_role\_ecs\_instance\_role\_id | n/a |
| extrajqueue\_aws\_iam\_role\_ecs\_instance\_role\_name | n/a |
| extrajqueue\_aws\_iam\_role\_ecs\_instance\_role\_unique\_id | n/a |
| extrajqueue\_aws\_iam\_role\_service\_role\_arn | n/a |
| extrajqueue\_aws\_iam\_role\_service\_role\_create\_date | n/a |
| extrajqueue\_aws\_iam\_role\_service\_role\_description | n/a |
| extrajqueue\_aws\_iam\_role\_service\_role\_id | n/a |
| extrajqueue\_aws\_iam\_role\_service\_role\_name | n/a |
| extrajqueue\_aws\_iam\_role\_service\_role\_spot\_arn | n/a |
| extrajqueue\_aws\_iam\_role\_service\_role\_spot\_create\_date | n/a |
| extrajqueue\_aws\_iam\_role\_service\_role\_spot\_description | n/a |
| extrajqueue\_aws\_iam\_role\_service\_role\_spot\_id | n/a |
| extrajqueue\_aws\_iam\_role\_service\_role\_spot\_name | n/a |
| extrajqueue\_aws\_iam\_role\_service\_role\_spot\_unique\_id | n/a |
| extrajqueue\_aws\_iam\_role\_service\_role\_unique\_id | n/a |
| extrajqueue\_aws\_security\_group\_instances\_arn | n/a |
| extrajqueue\_aws\_security\_group\_instances\_description | n/a |
| extrajqueue\_aws\_security\_group\_instances\_egress | n/a |
| extrajqueue\_aws\_security\_group\_instances\_id | n/a |
| extrajqueue\_aws\_security\_group\_instances\_ingress | n/a |
| extrajqueue\_aws\_security\_group\_instances\_name | n/a |
| extrajqueue\_aws\_security\_group\_instances\_owner\_id | n/a |
| extrajqueue\_aws\_security\_group\_instances\_vpc\_id | n/a |
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
