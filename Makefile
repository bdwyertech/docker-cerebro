#
# Docker Makefile
#

# Variables
IMAGE=bdwyertech/cerebro
CEREBRO_VERSION=0.7.2

#
.PHONY: help

help: ## This help.
        @awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


build: ## Build the Container
	docker build -t ${IMAGE} .

publish: build ## Build & Publish the Container
	docker tag ${IMAGE} ${IMAGE}:${CEREBRO_VERSION}
	docker push ${IMAGE}

run: build ## Build & Run the Container
	docker run --rm -it --publish 9000:9000 --name makerun ${IMAGE}

run_env: build ## Build & Run the Container with Test Env
	docker run --rm -it --publish 9000:9000 --env-file testenv --name makerun ${IMAGE}
