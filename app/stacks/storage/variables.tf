variable "project_id" {
  description = "The project ID."
  type        = string
  default     = ""
}

variable "prefix" {
  description = "Prefix that is placed in the name of the bucket."
  type        = string
  default     = ""
}

variable "names" {
  description = "List of buckets to create."
  type        = list(string)
  default     = []
}

variable "set_admin_roles" {
  description = "Activate the admin role on the bucket."
  type        = bool
  default     = false
}

variable "admins" {
  description = "Admin type user list for buckets."
  type        = list(string)
  default     = []
}

variable "versioning" {
  description = "List of buckets to configure versioning."
  type        = map(bool)
  default     = {}
}

variable "location" {
  description = "Configuration bucket location."
  type        = string
  default     = ""
}

variable "storage_class" {
  description = "Configuration bucket type class."
  type        = string
  default     = "STANDARD"
}

variable "labels" {
  description = "Configuration of tags in the bucket."
  type        = map(string)
  default     = {}
}

variable "lifecycle_rules" {
  description = "Configuring object permanence rules in the bucket."
  type        = list(object({
    action = object({
      type = string
    })
    condition = object({
      num_newer_versions = number
      days_since_noncurrent_time = number
    })
  }))
  default = []
}
