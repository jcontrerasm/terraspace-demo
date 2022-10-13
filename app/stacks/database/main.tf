module "database" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "10.0.0"

  name             = var.name
  project_id       = var.project_id
  database_version = var.database_version
  zone             = var.zone

  activation_policy    = var.activation_policy
  additional_databases = var.additional_databases
  additional_users     = var.additional_users
  availability_type	   = var.availability_type

  backup_configuration = var.backup_configuration
  database_flags       = var.database_flags
  db_charset           = var.db_charset
  db_collation         = var.db_collation
  db_name              = var.db_name
  deletion_protection  = var.deletion_protection
  disk_autoresize      = var.disk_autoresize
  disk_size            = var.disk_size
  disk_type            = var.disk_type
  enable_default_db    = var.enable_default_db
  enable_default_user  = var.enable_default_user
  encryption_key_name  = var.encryption_key_name
  insights_config      = var.insights_config
  iam_user_emails      = var.iam_user_emails
  ip_configuration     = var.ip_configuration

  maintenance_window_day          = var.maintenance_window_day
  maintenance_window_hour         = var.maintenance_window_hour
  maintenance_window_update_track = var.maintenance_window_update_track
  module_depends_on               = var.module_depends_on
  pricing_plan                    = var.pricing_plan
  random_instance_name            = var.random_instance_name
  region                          = var.region
  tier                            = var.tier
  user_labels                     = var.user_labels
  user_name                       = var.user_name
  user_password                   = var.user_password

  read_replica_deletion_protection = var.read_replica_deletion_protection
  read_replica_name_suffix         = var.read_replica_name_suffix
  read_replicas                    = var.read_replicas

  create_timeout = var.create_timeout
  update_timeout = var.update_timeout
  delete_timeout = var.delete_timeout
}
