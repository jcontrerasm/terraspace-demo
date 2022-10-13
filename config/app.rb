Terraspace.configure do |config|
  config.logger.level       = :info
  config.all.exclude_stacks = ["dns"]
  config.allow.envs = ["dev"]
  config.allow.regions = ["us-central1"]
end
