variable "project_id" {
  description = "The project ID."
  type        = string
  default     = ""
}

variable "network_name" {
  description = "VPC network name."
  type        = string
  default     = ""
}

variable "routing_mode" {
  description = "The network routing mode."
  type        = string
  default     = ""
}

variable "delete_default_internet_gateway_routes" {
  description = "Decide whether to create gateway network labels."
  type        = bool
  default     = false
}

variable "subnets" {
  description = "Configuring the subnets within the vpc."
  type        = list(object({
    subnet_name               = string
    subnet_ip                 = string
    subnet_region             = string
    subnet_private_access     = string
    subnet_flow_logs          = string
    subnet_flow_logs_interval = string
    subnet_flow_logs_sampling = number
    subnet_flow_logs_metadata = string
    description               = string
  }))
  default = []
}

variable "secondary_ranges" {
  description = "Secondary ranges that will be used in some of the subnets."
  type        = map(list(object({
    range_name    = string
    ip_cidr_range = string
  })))
  default = {}
}

variable "routes" {
  description = "Configuration of the routes within the subnet."
  type        = list(object({
    name              = string
    description       = string
    destination_range = string
    tags              = string
    next_hop_internet = string
    priority          = number
  }))
  default = []
}

variable "firewall_rules" {
  description = "Configuration firewall rules."
  type        = list(string)
  default     = []
}
