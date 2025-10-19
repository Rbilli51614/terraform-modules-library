variable "service_name" { type = string }
variable "image" { type = string }           # e.g., gcr.io/PROJECT/IMAGE:tag
variable "region" { type = string }
variable "allow_unauthenticated" { 
type = bool 
default = true 
}

