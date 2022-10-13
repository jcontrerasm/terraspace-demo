describe "service_account stack test" do

  # --------------------------------- Initial setup ---------------------------------

  before(:all) do
    stack_path = File.expand_path("../..", __dir__)
    ts_root = File.expand_path("../../..", stack_path)

    terraspace.build_test_harness(
      name:    "service_account_harness",
      modules: "#{ts_root}/app/modules",
      stacks:  {service_account: stack_path},
      config:  "#{stack_path}/test/spec/fixtures/config",
    )
    terraspace.up("service_account")
  end

  after(:all) do
    terraspace.down("service_account")
  end

  # --------------------------------- Test cases ---------------------------------

  it "if the email of the service account is the same as the one configured." do
    email = terraspace.output("service_account", "email")
    email_domain = "@workshops-test-363621.iam.gserviceaccount.com"

    expect(email).to eq "application#{email_domain}"
  end
end
