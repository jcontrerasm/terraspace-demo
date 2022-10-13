project_id = "workshops-363613"

names = [
  "dev-ws-app-backend-config"
]

admins = [
  "user:jcontrerasmeneses@gmail.com"
]

versioning = {
  dev-agor-app-infra-config = true
}

location = "us-central1"

storage_class = "STANDARD"

labels = {
  type = "private",
  env = "dev"
}

lifecycle_rules = [
  {
    action = {
      type = "Delete"
    }
    condition = {
      num_newer_versions = 5
      days_since_noncurrent_time = 7
    }
  }
]
