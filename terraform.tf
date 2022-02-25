provider "aws" {
  region = var.region
}
terraform {
  backend "s3" {
    bucket         = "ghostss11445566"
    key            = "ghostss11445566"
    region         = us-east-1
    encrypt        = true
    dynamodb_table = "tf-remote-state-lock"
  }
}
