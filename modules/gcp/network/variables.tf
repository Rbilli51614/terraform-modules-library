variable "project" { 
  type = string 
  default = "gcpclass6-5rb"
  }
variable "region"  {
  type = string 
  default = "us-central1"
  }
variable "vpc_name" { 
  type = string 
  default = "gcp-vpc" 
  }
variable "subnet_cidr" { 
  type = string 
  default = "10.20.1.0/24" 
  }