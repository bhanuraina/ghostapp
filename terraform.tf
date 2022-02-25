provider "aws" {
  region = var.region
}
terraform {
  backend "s3" {
    bucket         = var.s3_bucket_name
    key            = var.s3_bucket_name
    region         = var.region
    encrypt        = true
    kms_key_id     = aws_kms_key.this.arn
    dynamodb_table = var.dynamodb_table_name
  }
}
