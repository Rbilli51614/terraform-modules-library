variable "account_id" { 
    type = string
    default = "test-service-account"
    }
variable "display_name" { 
type = string 
default = null 
}
variable "project" {
    type = string 
    default = "gcpclass6-5rb"
    }
variable "roles" { 
type = list(string) 
default = [
    "roles/compute.admin", "roles/iam.serviceAccountAdmin", "roles/storage.admin","roles/run.admin",
    "roles/iam.serviceAccountKeyAdmin", "roles/resourcemanager.projectIamAdmin"
    ] 
}

