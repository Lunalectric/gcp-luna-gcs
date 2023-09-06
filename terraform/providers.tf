terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.50.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  backend "gcs" {
    bucket = "luna-terraform-backend"
    prefix = "luna-gcs"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
