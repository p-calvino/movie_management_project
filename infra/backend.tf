terraform {
  backend "s3" {
    bucket = "ta-terraform-tfstates-407372460187"
    key    = "projects/movie-mgmt-app/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}