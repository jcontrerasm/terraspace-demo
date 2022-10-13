variable "service_ranges" {
  description = "Blocks of services to configure in the vpc."
  type        = list(object({
    name          = string
    purpose       = string
    address_type  = string
    prefix_length = number
    address       = string
  }))
  default = []
}

variable "network" {
  description = "Name of VPC network connected with service producers using VPC peering."
  type        = string
  default     = ""
}

variable "service" {
  description = "Provider peering service that is managing peering connectivity for a service provider organization."
  type        = string
  default     = ""
}

variable "reserved_peering_ranges" {
  description = "Provider peering service that is managing peering connectivity for a service provider organization."
  type        = list(string)
  default     = []
}
