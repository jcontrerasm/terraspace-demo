name             = ""
project_id       = ""
database_version = "POSTGRES_14"
zone             = "us-central1-a"

activation_policy    = "ALWAYS"
additional_databases = []
additional_users     = []
availability_type	   = "ZONAL"

backup_configuration = {
  enabled = true
  location = "us-central1"
  point_in_time_recovery_enabled = true
  retention_unit = "COUNT"
  retained_backups = 5
  start_time = "06:00"
  transaction_log_retention_days = "5"
}

database_flags = [
  {
    name = "max_connections"
    value = 200
  },
  {
    name  = "cloudsql.iam_authentication"
    value = "on"
  }
]

db_charset          = "UTF8"
db_collation        = "en_US.UTF8"
db_name             = ""
deletion_protection = true
disk_autoresize     = true
disk_size           = 10
disk_type           = "PD_HDD"
enable_default_db   = false
enable_default_user = true
encryption_key_name = null
insights_config     = null

iam_user_emails = []

ip_configuration = {
  allocated_ip_range = null
  authorized_networks = []
  ipv4_enabled = true
  private_network = <%= output('network.network_id') %>
  require_ssl = true
}

maintenance_window_day          = 6
maintenance_window_hour         = 6
maintenance_window_update_track = "stable"
module_depends_on               = [<%= output('networking_connection.name') %>]
pricing_plan                    = "PER_USE"
random_instance_name            = false
region                          = "us-central1"
tier                            = "db-custom-4-5120"
user_labels                     = {}
user_name                       = "postgres"
user_password                   = ""

read_replica_deletion_protection = false
read_replica_name_suffix         = ""
read_replicas                    = []

create_timeout = "15m"
update_timeout = "15m"
delete_timeout = "15m"
