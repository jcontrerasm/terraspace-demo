service_ranges = [
  {
    name          = "apigee-runtime"
    purpose       = "VPC_PEERING"
    address_type  = "INTERNAL"
    prefix_length = 22
    address       = "10.5.0.0"
  },
  {
    name          = "apigee-support"
    purpose       = "VPC_PEERING"
    address_type  = "INTERNAL"
    prefix_length = 28
    address       = "10.5.4.0"
  },
  {
    name          = "db-core"
    purpose       = "VPC_PEERING"
    address_type  = "INTERNAL"
    prefix_length = 28
    address       = "10.6.0.0"
  }
]

reserved_peering_ranges = [
  "apigee-runtime",
  "apigee-support",
  "db-core"
]
