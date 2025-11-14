variable "project" {
    type = string
    default = "gcpclass6-5rb"
}

variable "service-name" { 
    type = string
    default = "google-cloud-run-service"
     }
variable "image" { 
    type = string
    default = "gcr.io/cloudrun/hello"
}           # e.g., gcr.io/PROJECT/IMAGE:tag
variable "region" { 
    type = string 
    default = "us-central1"
    }
variable "allow_unauthenticated" { 
    type = bool 
    default = true 
}

