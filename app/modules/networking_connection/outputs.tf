output "name" {
  value = google_compute_global_address.ip_block.*.name
}

output "peering" {
  value = google_service_networking_connection.vpc_connection.peering
}
