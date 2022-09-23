#Secrets para Cloud SQL
resource "google_secret_manager_secret" "secret-db-password" {
  secret_id = "DB_PASSWORD"
  labels = {
    label = "admin"
  }
  replication {
    automatic = true
  }
  depends_on    = [google_project_service.secretmanager_api]
}

resource "google_secret_manager_secret_version" "secret-db-password-version" {
  secret = google_secret_manager_secret.secret-db-password.id
  secret_data = "${module.sql-db.generated_user_password}"
}

//Concedendo acesso ao CloudRun para acesso a Secret
resource "google_secret_manager_secret_iam_member" "member" {
  project = google_secret_manager_secret.secret-db-password.project
  secret_id = google_secret_manager_secret.secret-db-password.secret_id
  role = "roles/secretmanager.secretAccessor"
  member = "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com"
}