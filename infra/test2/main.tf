data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "public_subnet_a" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_1_name]
  }
}

data "aws_ami" "amz_linux_image" {
  most_recent = true
  owners      = [var.amzn_ami_owner]

  filter {
    name   = "name"
    values = [var.amzn_ami_name]
  }
}