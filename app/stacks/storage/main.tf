module "private_buckets" {
  source          = "terraform-google-modules/cloud-storage/google"
  version         = "3.1.0"

  project_id      = var.project_id
  prefix          = var.prefix
  names           = var.names
  set_admin_roles = var.set_admin_roles
  admins          = var.admins
  versioning      = var.versioning
  location        = var.location
  storage_class   = var.storage_class
  labels          = var.labels
  lifecycle_rules = var.lifecycle_rules
}
