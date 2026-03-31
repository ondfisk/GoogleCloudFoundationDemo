module "logging_monitoring_project" {
  source = "./modules/project"

  name            = "central-logging-monitoring"
  org_id          = var.org_id
  folder_id       = module.root-folders.ids["Common"]
  billing_account = var.billing_account
  deletion_policy = "PREVENT"

  activate_apis = [
    "compute.googleapis.com",
    "monitoring.googleapis.com",
  ]

  depends_on = [
    resource.google_org_policy_policy.iam_managed_allowedPolicyMembers,
    module.cs-org-policy-iam_automaticIamGrantsForDefaultServiceAccounts,
    module.cs-org-policy-compute_skipDefaultNetworkCreation,
  ]
}

resource "google_monitoring_monitored_project" "cs-monitored-projects" {
  for_each      = module.projects
  metrics_scope = "locations/global/metricsScopes/${module.logging_monitoring_project.project_id}"
  name          = each.value.project_id
}

module "logging-destination" {
  source  = "terraform-google-modules/log-export/google//modules/logbucket"
  version = "~> 11.0"

  project_id               = module.logging_monitoring_project.project_id
  name                     = "ondfisk-logging"
  location                 = "global"
  retention_days           = 30
  log_sink_writer_identity = module.logsink-logbucketsink.writer_identity
}

module "logsink-logbucketsink" {
  source  = "terraform-google-modules/log-export/google"
  version = "~> 11.0"

  destination_uri      = module.logging-destination.destination_uri
  log_sink_name        = "logbucketsink-${var.org_id}"
  parent_resource_id   = var.org_id
  parent_resource_type = "organization"
  include_children     = true
  filter               = "logName: /logs/cloudaudit.googleapis.com%2Factivity OR logName: /logs/cloudaudit.googleapis.com%2Fsystem_event OR logName: /logs/cloudaudit.googleapis.com%2Fdata_access OR logName: /logs/cloudaudit.googleapis.com%2Faccess_transparency"
}
