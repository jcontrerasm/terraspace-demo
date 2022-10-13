terraform {
  required_version = "1.1.7"

  backend "gcs" {
    bucket         = "<%= expansion('terraform-state-:PROJECT-:REGION-:ENV') %>"
    prefix         = "<%= expansion(':REGION/:ENV/:BUILD_DIR') %>"
    encryption_key = "<%= google_secret('INFRA_ENCRYPTION_KEY') %>"
  }
}
