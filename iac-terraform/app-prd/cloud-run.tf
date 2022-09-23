// Cloud Run
// Depende da Conexão com o BD

resource "google_cloud_run_service" "default" {
  name     = "crun-${var.project}-${var.env}"
  location = var.location

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
        ports {
          container_port = 8000
          name           = "http1"
        }
        resources {
          limits = {
            cpu    = "1000m"
            memory = "512Mi"
          }
        }
        env {
          name  = "DB_HOST"
          value = "${var.db-host}"
        }
        env {
          name  = "DB_NAME"
          value = var.db-name
        }
        env {
          name  = "DB_USER"
          value = var.db-user
        }
        env {
          name = "DB_PASSWD"
          value_from {
            secret_key_ref {
              key  = "latest"
              name = var.db-secret-passwd 
            }
          }
        }
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale"      = "1"
        "autoscaling.knative.dev/maxScale"      = "10"
        "run.googleapis.com/cpu-throttling"     = false
        "run.googleapis.com/cloudsql-instances" = var.db-instance-connection-name
        "run.googleapis.com/client-name"        = "gcloud"//"terraform"
         # conector entre Cloud Run e VPC (Cloud SQL)
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
        # all egress from the service should go through the VPC Connector
        "run.googleapis.com/vpc-access-egress" = "private-ranges-only" //ou "all-traffic"
      }
    }
  }
  autogenerate_revision_name = true
  depends_on = [google_project_service.run_api]
}

// Make Cloud Run service publicly accessible
resource "google_cloud_run_service_iam_member" "allUsers" {
  service  = google_cloud_run_service.default.name
  location = google_cloud_run_service.default.location
  role     = "roles/run.invoker"
  member   = "allUsers"
  depends_on = [google_cloud_run_service.default]
}

# VPC access connector
resource "google_vpc_access_connector" "connector" {
  name          = "vpcconn-${var.project}-${var.env}"
  region        = var.location
  ip_cidr_range = "10.101.11.0/28" 
  max_throughput= 300
  network       = var.vpc-name
  depends_on    = [google_project_service.vpcaccess_api]
}
#:END