
1.0.0 / 2021-08-30
==================

* (BREAKING) chore: pins pre-commit-hooks to v4.0.1.
* chore: pins pre-commit-terraform to v1.50.0.
* feat: add pre-commit-afcmf (v0.1.2).
* chore: pins terraform to >= 0.14.
* chore: pins aws provider to >= 3.5.
* chore: bumps terraform + providers versions in example:
  - pins terraform to >= 0.14.
  - pins aws provider to >= 3.5.
  - pins random provider to >= 3.1.
  - pins tls provider to >= 3.1.
* refactor: examples, providers and versions.tf.
* refactor: get rid of providers.tf file in root module.

0.3.0
=====

* feat: Add possibility to attach additionnal policies in ECS instance profile

0.2.2
=====

* fix: `var.instance_sg_name` description and default value

0.2.1
=====

* fix: auto-select correct VPC for security group

0.2.0
=====

* feat: `var.compute_resource_instance_type` now allow families (ie: 'c5') and OPTIMAL
* chore: bump pre-commit hooks
* chore: remove 'disabled' example

0.1.1
=====

* fix: define `spot_iam_fleet_role` only when needed
* feat: better examples
* fix: var.queue\_name error\_message
* fix: var.ecs\_instance\_profile\_name default
* fix: var.service\_role\_spot\_name (AmazonEC2SpotFleetRole -> AmazonEC2SpotFleetTaggingRole)
* chore: move example from main.tf to deploy.tf
* chore: add tfsec to pre-commit
* chore: bump pre-commit hooks

0.1.0
=====

* feat: initial release
