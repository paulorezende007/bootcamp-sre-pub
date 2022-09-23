#:ARQUIVO PARA ATIVAÇÃO DAS APIS DO GOOGLE CLOUD. SE ESTAS APIS NÃO FOREM ATIVADAS, NÃO É POSSÍVEL CRIAR RECURSOS DE FORMA AUTOMATIZADA, VIA TERRAFORM
#:A API CLOUD RESOURCE MANAGER DEVE SER ATIVADA MANUALMENTE NA CONSOLE WEB

# Ativando API do Artifact Registry
resource "google_project_service" "artifactregistry_api" {
  service             = "artifactregistry.googleapis.com"
  disable_on_destroy  = false
}

# Ativando API do Identity and Access Management (IAM)
resource "google_project_service" "iam_api" {
  service             = "iam.googleapis.com"
  disable_on_destroy  = false
}

# Ativando API do Secret Manager
resource "google_project_service" "secretmanager_api" {
  service             = "secretmanager.googleapis.com"
  disable_on_destroy  = false
}

# Ativando API do Compute Engine
resource "google_project_service" "compute_api" {
  service             = "compute.googleapis.com"
  disable_on_destroy  = false
}

# Ativando API do VPC Access
resource "google_project_service" "vpcaccess_api" {
  service             = "vpcaccess.googleapis.com"
  disable_on_destroy  = false
}

# Ativando API do Service Networking
resource "google_project_service" "servicenetworking_api" {
  service             = "servicenetworking.googleapis.com"
  disable_on_destroy  = false
}

# Ativando API do Cloud SQL Admin
resource "google_project_service" "sqladmin_api" {
  service             = "sqladmin.googleapis.com"
  disable_on_destroy  = false
}

# Ativando API do Cloud Run Admin
resource "google_project_service" "run_api" {
  service             = "run.googleapis.com"
  disable_on_destroy  = false
}
#:END