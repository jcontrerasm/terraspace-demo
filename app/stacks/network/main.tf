module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "5.0.0"

  project_id                             = var.project_id
  network_name                           = var.network_name
  routing_mode                           = var.routing_mode
  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes
  subnets                                = var.subnets
  secondary_ranges                       = var.secondary_ranges
  routes                                 = var.routes
  firewall_rules                         = var.firewall_rules
}
