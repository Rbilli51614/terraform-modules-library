Google Cloud VPC Terraform Module

This Terraform configuration creates a custom VPC network and a subnetwork in Google Cloud Platform (GCP).

Resources Created

VPC Network (google_compute_network)

A custom VPC with no auto-created subnetworks.

Name configurable via vpc_name.

Subnetwork (google_compute_subnetwork)

A subnet within the VPC.

Configurable CIDR range and region.

Variables

These variables should be defined in your variables.tf file:

Variable	Type	Description	Default	Example
project	string	GCP project ID	n/a	"my-gcp-project"
region	string	Region to create the subnet in	n/a	"us-central1"
vpc_name	string	Name of the VPC network	"gcp-vpc"	"custom-vpc"
subnet_cidr	string	CIDR range for the subnet	"10.20.1.0/24"	"10.0.1.0/24"
Example Usage
module "gcp_vpc" {
  source      = "./path-to-module"
  project     = "my-gcp-project"
  region      = "us-central1"
  vpc_name    = "custom-vpc"
  subnet_cidr = "10.0.1.0/24"
}

Notes

The VPC is created with auto_create_subnetworks = false to allow full control over subnets.

The subnet CIDR and region are fully configurable.

Ensure your GCP project has the Compute Engine API enabled before applying this module.