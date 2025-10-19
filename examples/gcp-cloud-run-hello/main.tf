terraform {
  required_providers { google = { source = "hashicorp/google" } }
}

provider "google" {
  project = var.project
  region  = var.region
}

module "svc" {
  source  = "../../modules/gcp/cloud-run"
  service_name = "hello-cr"
  image   = var.image
  region  = var.region
}

variable "project" { type = string }
variable "region"  { 
  type = string 
  default = "us-central1" 
  }
variable "image"   { type = string } # e.g., us-docker.pkg.dev/PROJECT/hello:latest

output "url" { value = module.svc.url }

