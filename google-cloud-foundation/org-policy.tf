# Google Cloud security baseline constraints

module "cs-org-policy-iam_managed_disableServiceAccountKeyCreation" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "iam.managed.disableServiceAccountKeyCreation"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-org-policy-iam_managed_disableServiceAccountKeyUpload" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "iam.managed.disableServiceAccountKeyUpload"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-org-policy-iam_managed_preventPrivilegedBasicRolesForDefaultServiceAccounts" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "iam.managed.preventPrivilegedBasicRolesForDefaultServiceAccounts"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

resource "google_org_policy_policy" "iam_managed_allowedPolicyMembers" {
  name   = "organizations/${var.org_id}/policies/iam.managed.allowedPolicyMembers"
  parent = "organizations/${var.org_id}"

  spec {
    rules {
      enforce    = "TRUE"
      parameters = jsonencode({ "allowedPrincipalSets" : ["//cloudresourcemanager.googleapis.com/organizations/${var.org_id}"] })
    }
  }
}

resource "google_org_policy_policy" "essentialcontacts_managed_allowedContactDomains" {
  name   = "organizations/${var.org_id}/policies/essentialcontacts.managed.allowedContactDomains"
  parent = "organizations/${var.org_id}"

  spec {
    rules {
      enforce    = "TRUE"
      parameters = jsonencode({ "allowedDomains" : ["@${var.default_domain}"] })
    }
  }
}

module "cs-org-policy-compute_managed_restrictProtocolForwardingCreationForTypes" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "compute.managed.restrictProtocolForwardingCreationForTypes"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow = [
        "INTERNAL",
      ]
      deny       = []
      conditions = []
  }, ]
}

module "cs-org-policy-iam_automaticIamGrantsForDefaultServiceAccounts" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "iam.automaticIamGrantsForDefaultServiceAccounts"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-org-policy-iam_allowedPolicyMemberDomains" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "iam.allowedPolicyMemberDomains"
  policy_type      = "list"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = null
      allow = [
        var.customer_id,
      ]
      deny       = []
      conditions = []
  }, ]
}

module "cs-org-policy-storage_uniformBucketLevelAccess" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "storage.uniformBucketLevelAccess"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-org-policy-compute_setNewProjectDefaultToZonalDNSOnly" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "compute.setNewProjectDefaultToZonalDNSOnly"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

# Other organization policies

module "cs-org-policy-storage_publicAccessPrevention" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "storage.publicAccessPrevention"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-org-policy-compute_requireOsLogin" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "compute.requireOsLogin"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-org-policy-compute_vmExternalIpAccess" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "compute.vmExternalIpAccess"
  policy_type      = "list"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-org-policy-compute_disableNestedVirtualization" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "compute.disableNestedVirtualization"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-org-policy-compute_disableSerialPortAccess" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "compute.disableSerialPortAccess"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-org-policy-sql_restrictAuthorizedNetworks" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "sql.restrictAuthorizedNetworks"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-org-policy-compute_restrictXpnProjectLienRemoval" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "compute.restrictXpnProjectLienRemoval"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-org-policy-compute_skipDefaultNetworkCreation" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "compute.skipDefaultNetworkCreation"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-org-policy-compute_disableVpcExternalIpv6" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "compute.disableVpcExternalIpv6"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

module "cs-corp-folder-policy-gcp_resourceLocations" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "folder"
  policy_root_id   = split("/", module.landing-zone-folders.ids["Corp"])[1]
  constraint       = "gcp.resourceLocations"
  policy_type      = "list"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow = [
        "in:eu-locations",
      ]
      deny       = []
      conditions = []
  }, ]
}

module "cs-corp-folder-policy-run_managed_requireInvokerIam" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 7.2"

  policy_root      = "folder"
  policy_root_id   = split("/", module.landing-zone-folders.ids["Corp"])[1]
  constraint       = "run.managed.requireInvokerIam"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}

# Source: https://docs.cloud.google.com/sql/docs/mysql/org-policy/custom-org-policy
resource "google_org_policy_custom_constraint" "sql_ssl_mode" {
  name         = "custom.sqlSslMode"
  parent       = "organizations/${var.org_id}"
  display_name = "Only allow connections that are encrypted with SSL/TLS."
  description  = "Cloud SQL instances must only allow connections that are encrypted with SSL/TLS."

  resource_types = ["sqladmin.googleapis.com/Instance"]
  method_types   = ["CREATE", "UPDATE"]
  action_type    = "ALLOW"

  condition = "resource.settings.ipConfiguration.sslMode == 'ENCRYPTED_ONLY'"
}

module "cs-org-policy-sql_ssl_mode" {
  source     = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version    = "~> 7.2"
  depends_on = [google_org_policy_custom_constraint.sql_ssl_mode]

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "custom.sqlSslMode"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}
