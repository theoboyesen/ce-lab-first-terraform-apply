provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "lab_bucket" {
  bucket = "terraform-lab-bucket-theoboyesen-123" # Make globally unique!

  tags = {
    Name        = "Terraform Lab Bucket"
    Environment = "Learning"
    Lab         = "M4.01"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "lab_bucket" {
  bucket = aws_s3_bucket.lab_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.lab_bucket.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.lab_bucket.arn
}

output "bucket_region" {
  description = "Region of the S3 bucket"
  value       = aws_s3_bucket.lab_bucket.region
}

resource "aws_s3_bucket_server_side_encryption_configuration" "lab_bucket" {
  bucket = aws_s3_bucket.lab_bucket.id
  
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
