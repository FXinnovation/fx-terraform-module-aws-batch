module "disabled" {
  source = "../../"

  count = 0

  compute_resource_subnet_ids = ["subnet-xxxxxxxx"]
}
