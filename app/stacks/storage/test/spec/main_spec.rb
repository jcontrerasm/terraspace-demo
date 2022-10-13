describe "storage stack test" do

  # --------------------------------- Initial setup ---------------------------------

  before(:all) do
    stack_path = File.expand_path("../..", __dir__)
    ts_root = File.expand_path("../../..", stack_path)

    # Path logs: /tmp/terraspace/test-harnesses/storage_harness/app/stacks

    terraspace.build_test_harness(
      name:    "storage_harness",
      modules: "#{ts_root}/app/modules",
      stacks:  {storage: stack_path},
      config:  "#{stack_path}/test/spec/fixtures/config",
      tfvars:  {storage: "#{stack_path}/test/spec/fixtures/tfvars/test.tfvars"},
    )
    terraspace.up("storage")
  end

  after(:all) do
    terraspace.down("storage")
  end

  # --------------------------------- Test cases ---------------------------------

  it "if the number of storages is the total configured." do
    names_list = terraspace.output("storage", "names_list")

    expect(names_list.length).to be 3
  end

  it "if the storage is configured with the assigned name." do
    names_list = terraspace.output("storage", "names_list")

    expect(names_list.include?("dev-ws-app-backend-config-test-01")).to be true
    expect(names_list.include?("dev-ws-app-backend-config-test-02")).to be true
    expect(names_list.include?("dev-ws-app-backend-config-test-03")).to be true
  end

  it "if the storage is configured with the assigned location." do
    buckets_config_list = terraspace.output("storage", "buckets")

    buckets_config_list.map { |bucket_config|
      case bucket_config['name']
      when "dev-ws-app-backend-config-test-01"
        expect(bucket_config["location"]).to eq "US-CENTRAL1"
      when "dev-ws-app-backend-config-test-02"
        expect(bucket_config["location"]).to eq "US-CENTRAL1"
      when "dev-ws-app-backend-config-test-03"
        expect(bucket_config["location"]).to eq "US-CENTRAL1"
      end
    }
  end

  it "if the storage is configured with the assigned class." do
    buckets_config_list = terraspace.output("storage", "buckets")

    buckets_config_list.map { |bucket_config|
      case bucket_config["name"]
      when "dev-ws-app-backend-config-test-01"
        expect(bucket_config["storage_class"]).to eq "STANDARD"
      when "dev-ws-app-backend-config-test-02"
        expect(bucket_config["storage_class"]).to eq "STANDARD"
      when "dev-ws-app-backend-config-test-03"
        expect(bucket_config["storage_class"]).to eq "STANDARD"
      end
    }
  end

  it "if the storage is configured with assigned versioning." do
    buckets_config_list = terraspace.output("storage", "buckets")

    buckets_config_list.map { |bucket_config|
      puts "versioning ---> #{bucket_config["name"]}"

      case bucket_config["name"]
      when "dev-ws-app-backend-config-test-01"
        expect(bucket_config["versioning"][0]["enabled"]).to eq false
      when "dev-ws-app-backend-config-test-02"
        expect(bucket_config["versioning"][0]["enabled"]).to eq false
      when "dev-ws-app-backend-config-test-03"
        expect(bucket_config["versioning"][0]["enabled"]).to eq false
      end
    }
  end
end
