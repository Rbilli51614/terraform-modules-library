variable "project" {
    type    = string
    default = "gcpclass6-5rb"
}
variable "name" {
    type = string 
    default = "rb-test-bucket-51614"
    }
variable "location" {
type = string
default = "US"
}
variable "lifecycle_days" { 
type = number 
default = 30 
}
variable "uniform_access" { 
type = bool 
default = true 
}

