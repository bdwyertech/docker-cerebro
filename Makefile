#
# Docker Makefile
#

# Variables
IMAGE=bdwyertech/cerebro
CEREBRO_VERSION=0.7.2

# Enable Spaces for Command Blocks
.RECIPEPREFIX +=

# Image Build
.PHONY: build
build:
	docker build -t ${IMAGE} .

# Image Publish
.PHONY: publish
publish: build
	docker tag ${IMAGE} ${IMAGE}:${CEREBRO_VERSION}
	docker push ${IMAGE}
