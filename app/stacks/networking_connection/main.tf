module "networking_connection" {
  source  = "../../modules/networking_connection"

  service_ranges          = var.service_ranges
  network                 = var.network
  service                 = var.service
  reserved_peering_ranges = var.reserved_peering_ranges
}
