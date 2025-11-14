resource "google_service_account" "sa" {
  project      = var.project
  account_id   = var.account_id
  display_name = coalesce(var.display_name, var.account_id)
}

resource "google_project_iam_member" "bindings" {
  for_each = toset(var.roles)
  project  = var.project
  role     = each.value
  member   = "serviceAccount:${google_service_account.sa.email}"
}

output "email" { value = google_service_account.sa.email }

