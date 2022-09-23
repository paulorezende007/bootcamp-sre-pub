resource "google_artifact_registry_repository" "repository" {
  provider      = google-beta
  location      = var.location
  repository_id = "gar-${var.env}-${var.project}"
  description   = var.description
  format        = var.format
  }
#:END