variable "aws_owner_id" {
  description = "Contains the Owner ID of the ami for amazon linux"
  type        = string
}

variable "aws_ami_name" {
  description = "Name of the ami I want for my project"
  type        = string
}

variable "my_keypair" {
  description = "Name of the Keypair"
  type        = string
}

variable "ec2_type" {
  description = "Name of instance type"
  type        = string
}

variable "aws_vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "vpc_id" {
  description = "ID of VPC"
  type        = string
}