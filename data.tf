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
