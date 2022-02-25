provider "aws" {
  region = var.region
}
terraform {
  backend "s3" {
    bucket         = aws_s3_bucket.sate.id
    key            = aws_s3_bucket.sate.id
    region         = us-east-1
    encrypt        = true
    kms_key_id     = aws_kms_key.this.arn
    dynamodb_table = aws_dynamodb_table.lock.id
  }
}
