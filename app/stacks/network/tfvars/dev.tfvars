project_id   = "workshops-363613"
network_name = "vpc-custom-r9l4"

subnets = [
  {
    subnet_name               = "public-subnet"
    subnet_ip                 = "10.0.0.0/20"
    subnet_region             = "us-central1"
    subnet_private_access     = "true"
    subnet_flow_logs          = "true"
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling = 0.7
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    description               = "This subnet is for public resources"
  }
]

routes = [
  {
    name              = "egress-internet"
    description       = "Route through IGW to access internet"
    destination_range = "0.0.0.0/0"
    tags              = ""
    next_hop_internet = "true"
    priority          = 0
  }
]

firewall_rules = []
