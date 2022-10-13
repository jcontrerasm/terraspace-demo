## ------------------------------------- ENVIRONMENT -------------------------------------

ENVIRONMENT        ?= dev
DOCKER_VOLUME       = -v $(PWD)/:/root -v $(HOME)/.config/gcloud:/root/.config/gcloud -v $(GCP_CREDENTIALS_DEPLOY):/root/gcp-credential.json
DOCKER_ENV          = --env-file ./environments/.$(ENVIRONMENT).env --env GOOGLE_APPLICATION_CREDENTIALS=/root/gcp-credential.json
DOCKER_IMAGE        = boltops/terraspace:1.1.5-ubuntu

## ------------------------------------- TASKS ------------------------------------------

login:
	gcloud auth login --project=$(PROJECT_ID)

get-secrets:
	gcloud secrets list

generate-encryption-key:
	@python3 ./scripts/encryption-key.py

validate:
	docker run -i --rm $(DOCKER_VOLUME) $(DOCKER_ENV) $(DOCKER_IMAGE) \
	-c "bundle install && \
	curl -LO https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_386.zip && \
	unzip terraform_1.1.7_linux_386.zip && \
	mv terraform /usr/bin/ && \
	TS_ENV=$(ENVIRONMENT) terraspace all validate -y"

plan:
	docker run -i --rm $(DOCKER_VOLUME) $(DOCKER_ENV) $(DOCKER_IMAGE) \
	-c "bundle install && \
	curl -LO https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_386.zip && \
	unzip terraform_1.1.7_linux_386.zip && \
	mv terraform /usr/bin/ && \
	TS_ENV=$(ENVIRONMENT) terraspace all plan"

up:
	docker run -i --rm $(DOCKER_VOLUME) $(DOCKER_ENV) $(DOCKER_IMAGE) \
	-c "bundle install && \
	curl -LO https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_386.zip && \
	unzip terraform_1.1.7_linux_386.zip && \
	mv terraform /usr/bin/ && \
	TS_ENV=$(ENVIRONMENT) terraspace all up -y"

graph:
	terraspace all graph --format text

up-all-local:
	GOOGLE_PROJECT=$(GOOGLE_PROJECT) \
	GOOGLE_APPLICATION_CREDENTIALS=$(PWD)/credentials/workshops.json \
	terraspace all up -y

down-all-local:
	GOOGLE_PROJECT=$(GOOGLE_PROJECT) \
	GOOGLE_APPLICATION_CREDENTIALS=$(PWD)/credentials/workshops.json \
	terraspace all down -y

test-local:
	cd app/stacks/$(STACK_NAME) && \
	GOOGLE_PROJECT=$(GOOGLE_PROJECT_TEST) \
	GOOGLE_APPLICATION_CREDENTIALS=$(PWD)/credentials/workshops-test.json \
	terraspace test

test-all-local:
	GOOGLE_PROJECT=$(GOOGLE_PROJECT_TEST) \
	GOOGLE_APPLICATION_CREDENTIALS=$(PWD)/credentials/workshops-test.json \
	python3 ./scripts/run_test.py run_test
