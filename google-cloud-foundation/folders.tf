module "root-folders" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 5.0"
  parent  = "organizations/${var.org_id}"
  names = [
    "Common",
    "Landing Zones",
    "Sandbox",
    "Decommissioned"
  ]
}

module "landing-zone-folders" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 5.0"
  parent  = module.root-folders.ids["Landing Zones"]
  names = [
    "Corp",
    "Online"
  ]
}

resource "time_sleep" "wait_60s" {
  depends_on      = [module.landing-zone-folders]
  create_duration = "60s"
}

resource "google_resource_manager_capability" "capability" {
  provider        = google-beta
  for_each        = toset(["Corp", "Online"])
  value           = true
  parent          = module.landing-zone-folders.ids[each.key]
  capability_name = "app-management"
  depends_on      = [time_sleep.wait_60s]
}
