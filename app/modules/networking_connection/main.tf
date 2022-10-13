resource "google_compute_global_address" "ip_block" {
  count = length(var.service_ranges)

  name          = var.service_ranges[count.index].name
  purpose       = var.service_ranges[count.index].purpose
  address_type  = var.service_ranges[count.index].address_type
  prefix_length = var.service_ranges[count.index].prefix_length
  network       = var.network
  address       = var.service_ranges[count.index].address
}

resource "google_service_networking_connection" "vpc_connection" {
  network                 = var.network
  service                 = var.service
  reserved_peering_ranges = var.reserved_peering_ranges

  depends_on = [
    google_compute_global_address.ip_block
  ]
}
