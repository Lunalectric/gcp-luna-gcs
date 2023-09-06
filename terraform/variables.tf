variable "project_id" {}

variable "project_number" {}

variable "region" {
  default = "us-central1"
}

variable "location" {
  default = "US"
}

variable "git_org" {
  description = "Name of GitHub Organziation where automation code is stored"
}

variable "git_repo" {
  description = "Name of GitHub repository where automation code is stored"
}

variable "team" {
  description = "Name of the team that owns the resource"
}

variable "environment" {
  description = "Name of the environment the resource is provisioned in"
}

variable "terraform_by_managed" {
  description = "String value whether the resource is managed by Terraform or not"
}
