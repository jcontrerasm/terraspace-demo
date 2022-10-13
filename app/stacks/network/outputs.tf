output "network" {
  value = module.vpc.network
}

output "network_id" {
  value = module.vpc.network_id
}

output "network_name" {
  value = module.vpc.network_name
}

output "route_names" {
  value = module.vpc.route_names
}

output "subnets_names" {
  value = module.vpc.subnets_names
}
