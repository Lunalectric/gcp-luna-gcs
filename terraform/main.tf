resource "random_string" "random" {
  length  = 4
  lower   = true
  upper   = false
  special = false
}


resource "google_storage_bucket" "example_storage_from_resource" {
  name          = "luna-gcs-${var.environment}-${var.project_number}"
  location      = var.location
  force_destroy = true

  uniform_bucket_level_access = true

  labels = {
    environment          = var.environment
    git_org              = var.git_org
    git_repo             = var.git_repo
    team                 = var.team
    managed_by_terraform = "true"
  }
}

module "example_storage_from_module" {
  source = "terraform-google-modules/cloud-storage/google"

  prefix     = "luna-gcs-${var.environment}-${var.project_number}"
  names      = ["one", "two", "three"]
  project_id = var.project_id
  location   = var.location

  bucket_policy_only = {
    one   = true
    two   = true
    three = true
  }

  labels = {
    environment          = var.environment
    git_org              = var.git_org
    git_repo             = var.git_repo
    team                 = var.team
    managed_by_terraform = "true"
  }
}