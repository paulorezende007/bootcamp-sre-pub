#:FILE WITH PROVIDERS
terraform {
  required_version = ">= 1.2"

  backend "azurerm" {
    resource_group_name   = ""
    storage_account_name  = ""
    container_name        = "tfstate"
    key                   = "bootcamp-sre-app-dev.tfstate"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0, < 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.0, < 5.0"
    }
  }

}

provider "google" {
  project     = ""
  region      = "us-central1"
  zone        = "us-central1-a"
}

provider "google-beta" {
  project     = ""
  region      = "us-central1"
  zone        = "us-central1-a"
}
#:END