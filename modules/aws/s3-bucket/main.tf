  resource "aws_s3_bucket" "this" { 
    bucket = var.name 
    force_destroy = var.force_destroy 
    }

  resource "aws_s3_bucket_public_access_block" "pab" {
    bucket                  = aws_s3_bucket.this.id
    block_public_acls       = var.block_public_access
    block_public_policy     = var.block_public_access
    ignore_public_acls      = var.block_public_access
    restrict_public_buckets = var.block_public_access
  }

  resource "aws_s3_bucket_versioning" "v" {
    bucket = aws_s3_bucket.this.id
    versioning_configuration { status = var.versioning ? "Enabled" : "Suspended" }
  }

  resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
    bucket = aws_s3_bucket.this.id
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.kms_master_key_id == null ? "AES256" : "aws:kms"
        kms_master_key_id = var.kms_master_key_id
      }
    }
  }

  resource "aws_s3_bucket_lifecycle_configuration" "lc" {
    bucket = aws_s3_bucket.this.id
    rule {
      id     = "expire-old"
      status = "Enabled"
      expiration { days = var.lifecycle_days }
    }
  }

  output "bucket" { value = aws_s3_bucket.this.bucket }

