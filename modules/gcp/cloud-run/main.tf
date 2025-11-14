resource "google_cloud_run_service" "svc" {
  name     = var.service-name
  location = var.region
  project = var.project
  template {
    spec {
      containers {
        image = var.image
        ports { container_port = 8080 }
      }
    }
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  project = var.project 
  count  = var.allow_unauthenticated ? 1 : 0
  service = google_cloud_run_service.svc.name
  location = var.region
  role   = "roles/run.invoker"
  member = "allUsers"
}

output "url" { value = google_cloud_run_service.svc.status[0].url }
