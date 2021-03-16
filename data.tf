#####
# Datasources
#####

data "aws_iam_policy_document" "sts_ec2" {
  statement {
    sid     = "1"
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "sts_batch" {
  statement {
    sid     = "1"
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "batch.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "sts_spotfleet" {
  statement {
    sid     = "1"
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "spotfleet.amazonaws.com"
      ]
    }
  }
}

# In order to find current VPC
data "aws_subnet" "this" {
  id = var.compute_resource_subnet_ids[0]
}
