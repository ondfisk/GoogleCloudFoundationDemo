module "projects" {
  for_each = { for obj in var.projects : obj.name => obj }
  source   = "./modules/project"

  name            = each.value.name
  org_id          = var.org_id
  folder_id       = coalesce(lookup(module.root-folders.ids, each.value.folder, null), lookup(module.landing-zone-folders.ids, each.value.folder, null))
  billing_account = coalesce(each.value.billing_account, var.billing_account)
  admin           = each.value.admin

  depends_on = [
    module.logging_monitoring_project
  ]
}
