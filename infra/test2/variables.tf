#DEFINE VARIABLES
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "public_subnet_1_name" {
  description = "Name of my Public Subnet 1"
  type        = string
}

variable "amzn_ami_name" {
  description = "The name of the AMI"
  type        = string
}

variable "amzn_ami_owner" {
  description = "The owner ID of the AMI"
  type        = string
}

variable "movie_app_ec2_type" {
  description = "The type of the EC2 instance for movie app"
  type        = string
}

variable "keypair_name" {
  description = "The keypair"
  type        = string
}
