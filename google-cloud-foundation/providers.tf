# Required if using User ADCs (Application Default Credentials) for Org Policy API.
provider "google" {
  user_project_override = true
  billing_project       = var.billing_project
}

# Required if using User ADCs (Application Default Credentials) for Cloud Identity API.
provider "google-beta" {
  user_project_override = true
  billing_project       = var.billing_project
}
