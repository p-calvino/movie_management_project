terraform {
  backend "s3" {
    bucket = "ta-terraform-tfstates-407372460187"
    key    = "ec2-exercise/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}