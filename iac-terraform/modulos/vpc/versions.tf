terraform {
  required_version  = ">= 0.13.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.45"
    }
  }
  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-network:vpc/v5.0.0"
  }
}
#:END