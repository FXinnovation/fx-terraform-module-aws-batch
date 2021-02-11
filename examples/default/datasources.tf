data "aws_vpc" "this" {
  default = true
}

data "aws_subnet_ids" "this" {
  vpc_id = data.aws_vpc.this.id
}

data "aws_ami" "amazon-linux-2-ami" {
  most_recent = true
  owners      = ["amazon"]
  name_regex  = "amzn2-ami-hvm*"

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
