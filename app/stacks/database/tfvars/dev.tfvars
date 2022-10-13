name             = "database-custom-rj5f"
project_id       = "workshops-363613"
database_version = "POSTGRES_14"
user_password    = "<%= google_secret('GCP_DB_PASSWORD') %>"
disk_autoresize  = false
disk_size        = 10
disk_type        = "PD_HDD"
tier             = "db-custom-2-4096"
region           = "us-central1"
zone             = "us-central1-a"

insights_config = {
  query_string_length = 1024
  record_application_tags = true
  record_client_address = true
}

backup_configuration = {
  enabled = true
  location = "us-central1"
  point_in_time_recovery_enabled = true
  retention_unit = "COUNT"
  retained_backups = 5
  start_time = "06:00"
  transaction_log_retention_days = "5"
}

iam_user_emails = []

ip_configuration = {
  allocated_ip_range = "db-core"
  authorized_networks = []
  ipv4_enabled = true
  private_network = <%= output('network.network_id') %>
  require_ssl = true
}

user_labels = {
  "app": "core"
}
