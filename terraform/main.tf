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
    git_org              = "lunalectric"
    git_repo             = "gcp-luna-gcs"
    managed_by_terraform = "true"
    team                 = "platform-engineering"
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
    git_org              = "lunalectric"
    git_repo             = "gcp-luna-gcs"
    managed_by_terraform = "true"
    team                 = "platform-engineering"
  }
}
