variable "name" { type = string }
variable "block_public_access" { 
    type = bool 
    default = true 
    }
variable "versioning" { 
    type = bool 
    default = true 
}
variable "lifecycle_days" { 
    type = number 
    default = 30 
    }
variable "force_destroy" { 
    type = bool 
    default = false 
    }
variable "kms_master_key_id" { 
    type = string 
    default = null 
    }

