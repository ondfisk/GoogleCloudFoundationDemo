module "projects-iam-logging-viewer" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 8.0"

  projects = [
    module.logging_monitoring_project.project_id,
  ]
  bindings = {
    "roles/logging.viewer" = [
      "group:gcp-logging-monitoring-viewers@${var.default_domain}",
    ]
  }
}

module "projects-iam-logging-private-log-viewer" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 8.0"

  projects = [
    module.logging_monitoring_project.project_id,
  ]
  bindings = {
    "roles/logging.privateLogViewer" = [
      "group:gcp-logging-monitoring-viewers@${var.default_domain}",
    ]
  }
}

module "projects-iam-bigquery-data-viewer-1" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 8.0"

  projects = [
    module.logging_monitoring_project.project_id,
  ]
  bindings = {
    "roles/bigquery.dataViewer" = [
      "group:gcp-logging-monitoring-viewers@${var.default_domain}",
    ]
  }
}

module "projects-iam-pubsub-viewer-1" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 8.0"

  projects = [
    module.logging_monitoring_project.project_id,
  ]
  bindings = {
    "roles/pubsub.viewer" = [
      "group:gcp-logging-monitoring-viewers@${var.default_domain}",
    ]
  }
}

module "projects-iam-monitoring-viewer" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 8.0"

  projects = [
    module.logging_monitoring_project.project_id,
  ]
  bindings = {
    "roles/monitoring.viewer" = [
      "group:gcp-logging-monitoring-viewers@${var.default_domain}",
    ]
  }
}

module "projects-iam-bigquery-data-viewer-2" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 8.0"

  projects = [
    module.logging_monitoring_project.project_id,
  ]
  bindings = {
    "roles/bigquery.dataViewer" = [
      "group:gcp-security-admins@${var.default_domain}",
    ]
  }
}

module "projects-iam-pubsub-viewer-2" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 8.0"

  projects = [
    module.logging_monitoring_project.project_id,
  ]
  bindings = {
    "roles/pubsub.viewer" = [
      "group:gcp-security-admins@${var.default_domain}",
    ]
  }
}
