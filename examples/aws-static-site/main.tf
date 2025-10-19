terraform {
  required_providers { aws = { source = "hashicorp/aws" } }
}

provider "aws" { region = var.region }

module "bucket" {
  source              = "../../modules/aws/s3-bucket"
  name                = var.bucket_name
  block_public_access = false   # static site public
  lifecycle_days      = 30
}

variable "region" { 
  type = string 
  default = "us-east-1" 
  }
variable "bucket_name" { type = string }

output "bucket" { value = module.bucket.bucket }

