project_id = "workshops-test-363621"

names = [
  "dev-ws-app-backend-config-test-01",
  "dev-ws-app-backend-config-test-02",
  "dev-ws-app-backend-config-test-03"
]

admins = [
  "user:jcontrerasmeneses@gmail.com"
]

versioning = {
  dev-agor-app-infra-config-test-01 = false
  dev-agor-app-infra-config-test-02 = false
  dev-agor-app-infra-config-test-03 = false
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
