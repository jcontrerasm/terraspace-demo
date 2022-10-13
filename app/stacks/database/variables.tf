variable "name" {
  description = "The name of the Cloud SQL resources."
  type        = string
  default     = ""
}

variable "project_id" {
  description = "The project ID to manage the Cloud SQL resources."
  type        = string
  default     = ""
}

variable "database_version" {
  description = "The database version to use."
  type        = string
  default     = ""
}

variable "zone" {
  description = "The zone for the master instance, it should be something like: us-central1-a, us-east1-c."
  type        = string
  default     = ""
}

variable "activation_policy" {
  description = "The activation policy for the master instance.Can be either ALWAYS, NEVER or ON_DEMAND."
  type        = string
  default     = ""
}

variable "additional_databases" {
  description = "A list of databases to be created in your cluster."
  type        = list(object({
    name      = string
    charset   = string
    collation = string
  }))
  default = []
}

variable "additional_users" {
  description = "A list of users to be created in your cluster."
  type        = list(object({
    name     = string
    password = string
  }))
  default = []
}

variable "availability_type" {
  description = "The availability type for the master instance.This is only used to set up high availability for the PostgreSQL instance. Can be either ZONAL or REGIONAL."
  type        = string
  default     = "ZONAL"
}

variable "backup_configuration" {
  description = "The backup_configuration settings subblock for the database setings."
  type        = object({
    enabled                        = bool
    start_time                     = string
    location                       = string
    point_in_time_recovery_enabled = bool
    transaction_log_retention_days = string
    retained_backups               = number
    retention_unit                 = string
  })
  default = {
    enabled = false
    location = null
    point_in_time_recovery_enabled = false
    retained_backups = null
    retention_unit = null
    start_time = null
    transaction_log_retention_days = null
  }
}

variable "database_flags" {
  description = "The database flags for the master instance."
  type        = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "db_charset" {
  description = "The charset for the default database."
  type        = string
  default     = "UTF8"
}

variable "db_collation" {
  description = "The collation for the default database."
  type        = string
  default     = "en_US.UTF8"
}

variable "db_name" {
  description = "The name of the default database to create."
  type        = string
  default     = ""
}

variable "deletion_protection" {
  description = "Used to block Terraform from deleting a SQL Instance."
  type        = bool
  default     = true
}

variable "disk_autoresize" {
  description = "Configuration to increase storage size."
  type        = bool
  default     = false
}

variable "disk_size" {
  description = "The disk size for the master instance."
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_HDD"
}

variable "enable_default_db" {
  description = "Enable or disable the creation of the default database."
  type        = bool
  default     = false
}

variable "enable_default_user" {
  description = "Enable or disable the creation of the default user."
  type        = bool
  default     = true
}

variable "encryption_key_name" {
  description = "The full path to the encryption key used for the CMEK disk encryption."
  type        = string
  default     = null
}

variable "insights_config" {
  description = "The insights_config settings for the database."
  type        = object({
    query_string_length     = number
    record_application_tags = bool
    record_client_address   = bool
  })
  default = null
}

variable "iam_user_emails" {
  description = "A list of IAM users to be created in your cluster."
  type        = list(string)
  default     = []
}

variable "ip_configuration" {
  description = "The ip configuration for the master instances."
  type        = object({
    authorized_networks = list(map(string))
    ipv4_enabled        = bool
    private_network     = string
    require_ssl         = bool
    allocated_ip_range  = string
  })
  default = {
    allocated_ip_range = null
    authorized_networks = []
    ipv4_enabled = true
    private_network = null
    require_ssl = null
  }
}

variable "maintenance_window_day" {
  description = "The day of week (1-7) for the master instance maintenance."
  type        = number
  default     = 1
}

variable "maintenance_window_hour" {
  description = "The hour of day (0-23) maintenance window for the master instance maintenance."
  type        = number
  default     = 6
}

variable "maintenance_window_update_track" {
  description = "The update track of maintenance window for the master instance maintenance.Can be either canary or stable."
  type        = string
  default     = "canary"
}

variable "module_depends_on" {
  description = "List of modules or resources this module depends on."
  type        = list(any)
  default     = []
}

variable "pricing_plan" {
  description = "The pricing plan for the master instance."
  type        = string
  default     = "PER_USE"
}

variable "random_instance_name" {
  description = "Sets random suffix at the end of the Cloud SQL resource name."
  type        = bool
  default     = false
}

variable "region" {
  description = "The region of the Cloud SQL resources."
  type        = string
  default     = "us-central1"
}

variable "tier" {
  description = "The tier for the master instance."
  type        = string
  default     = "db-f1-micro"
}

variable "user_labels" {
  description = "The key/value labels for the master instances."
  type        = map(string)
  default     = {}
}

variable "user_name" {
  description = "The name of the default user."
  type        = string
  default     = ""
}

variable "user_password" {
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
  type        = string
  default     = ""
}

variable "read_replica_deletion_protection" {
  description = "Used to block Terraform from deleting replica SQL Instances."
  type        = bool
  default     = false
}

variable "read_replica_name_suffix" {
  description = "The optional suffix to add to the read instance name."
  type        = string
  default     = ""
}

variable "read_replicas" {
  description = "List of read replicas to create."
  type        = list(object({
    name            = string
    tier            = string
    zone            = string
    disk_type       = string
    disk_autoresize = bool
    disk_size       = string
    user_labels     = map(string)
    database_flags = list(object({
      name  = string
      value = string
    }))
    ip_configuration = object({
      authorized_networks = list(map(string))
      ipv4_enabled        = bool
      private_network     = string
      require_ssl         = bool
      allocated_ip_range  = string
    })
    encryption_key_name = string
  }))
  default = []
}

variable "create_timeout" {
  description = "The optional timout that is applied to limit long database creates."
  type        = string
  default     = "15m"
}

variable "update_timeout" {
  description = "The optional timout that is applied to limit long database updates."
  type        = string
  default     = "15m"
}

variable "delete_timeout" {
  description = "The optional timout that is applied to limit long database deletes."
  type        = string
  default     = "15m"
}
