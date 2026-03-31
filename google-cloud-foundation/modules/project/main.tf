module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 18.0"

  name            = var.name
  project_id      = "cs-${substr(md5("${var.name}${var.org_id}"), 0, 27)}"
  org_id          = var.org_id
  folder_id       = var.folder_id
  billing_account = var.billing_account
  activate_apis   = var.activate_apis
  deletion_policy = var.deletion_policy
}

resource "google_project_iam_member" "admin" {
  count   = var.admin != null ? 1 : 0
  project = module.project-factory.project_id
  role    = "roles/admin"
  member  = var.admin
}
