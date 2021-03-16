# CHANGELOG

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
