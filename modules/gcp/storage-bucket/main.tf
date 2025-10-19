resource "google_storage_bucket" "this" {
  name                        = var.name
  location                    = var.location
  uniform_bucket_level_access = var.uniform_access
  force_destroy               = false
  versioning { enabled = true }
  lifecycle_rule {
    action { type = "Delete" }
    condition { age = var.lifecycle_days }
  }
}

output "bucket_name" { value = google_storage_bucket.this.name }

