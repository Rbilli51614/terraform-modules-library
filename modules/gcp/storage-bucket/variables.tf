variable "name" { type = string }
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

