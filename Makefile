# Makefile for building VM images

PACKER_BUILDS_DIR := packer/builds
BUILD_DIR := builds

.PHONY: all build validate clean

all: build

build:
ifndef VM
	$(error VM is not set. Usage: make build VM=<packer-template-name>)
endif
	@echo "Building VM image for $(VM)..."
	@packer build -var-file="packer/common/variables.pkr.hcl" $(PACKER_BUILDS_DIR)/$(VM).pkr.hcl

validate:
ifndef VM
	$(error VM is not set. Usage: make validate VM=<packer-template-name>)
endif
	@echo "Validating Packer template for $(VM)..."
	@packer validate -var-file="packer/common/variables.pkr.hcl" $(PACKER_BUILDS_DIR)/$(VM).pkr.hcl

clean:
	@echo "Cleaning up build artifacts..."
	@rm -rf $(BUILD_DIR)/*
	@rm -rf .packer_cache
	@rm -f packer.log
