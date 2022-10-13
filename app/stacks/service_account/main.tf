module "create_service_account_application" {
  source       = "../../modules/service_account"
  account_id   = "application"
  display_name = "application"
  description  = "Service Account for application"
}

module "roles_service_account_application" {
  source                  = "terraform-google-modules/iam/google//modules/member_iam"
  version                 = "7.4.1"
  service_account_address = module.create_service_account_application.email
  prefix                  = "serviceAccount"
  project_id              = var.project_id
  project_roles           = var.roles_service_account_application
}
