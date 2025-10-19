terraform {
  required_providers { google = { source = "hashicorp/google" } }
}

provider "google" {
  project = var.project
}

module "bucket" {
  source         = "../../modules/gcp/storage-bucket"
  name           = var.name
  location       = var.location
  lifecycle_days = 60
}

variable "project"  { type = string }
variable "name"     { type = string }
variable "location" { 
  type = string 
  default = "US" 
  }

output "bucket_name" { value = module.bucket.bucket_name }

