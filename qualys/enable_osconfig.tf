resource "google_compute_project_metadata_item" "osconfig_enable_meta" {
  count = length(local.project_ids)
  project = local.project_ids[count.index]

  key     = "enable-osconfig"
  value   = "TRUE"
}

module "project_services" {
  source = "terraform-google-modules/project-factory/google//modules/project_services"

  count      = length(local.project_ids)
  project_id = local.project_ids[count.index]

  enable_apis = true
  activate_apis = [
    "osconfig.googleapis.com",
  ]
}
