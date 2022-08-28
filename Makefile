export MODULE_NAME=hello
export MODULE_VERSION=0.0.1
export SHELL=/bin/bash

all: tidy compile verify

tidy:
	@echo -e "Running go mod tidy..."
	go mod tidy -v
.PHONY: tidy

compile:
	@echo -e "\nCompiling and generating build artifacts for common OS and archiectures:"
	bash scripts/compile.sh
.PHONY: compile

verify:
	@echo -e "\nVerifying build artifacts:"
	file bin/*/*
.PHONY: verify
