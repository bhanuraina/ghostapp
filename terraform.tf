provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket         = "THE_NAME_OF_THE_STATE_BUCKET"
    key            =  var.s3_bucket_name
    region         = var.region
    encrypt        = true
    kms_key_id     = aws_kms_key.this.arn
    dynamodb_table = var.dynamodb_table_name
  }
}
