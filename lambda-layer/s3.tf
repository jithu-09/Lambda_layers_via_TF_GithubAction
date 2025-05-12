data "aws_caller_identity" "current" {}

data "aws_s3_bucket" "existing_bucket" {
  bucket = "bucket-store-j09"
}

