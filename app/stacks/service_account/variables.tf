variable "project_id" {
  description = "The project ID."
  type        = string
  default     = ""
}

variable "roles_service_account_application" {
  description = "Role assignment for the application service account."
  type        = list(string)
  default     = []
}
