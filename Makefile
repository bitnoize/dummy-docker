
IMAGENAME := ghcr.io/bitnoize/office

.PHONY: help build rebuild push pull

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build rebuild push pull"

#build: export BUILD_OPTS := ...
build: .build-latest

rebuild: export BUILD_OPTS := --pull --no-cache
rebuild: .build-latest

.build-latest:
	docker build $(BUILD_OPTS) \
		-t "$(IMAGENAME):latest" \
		-f Dockerfile.bullseye \
		.

#push: export PUSH_OPTS := ...
push: .push-latest

.push-latest:
	docker push $(PUSH_OPTS) "$(IMAGENAME):latest"

#pull: export PULL_OPTS := ...
pull: .pull-latest

.pull-latest:
	docker pull $(PULL_OPTS) "$(IMAGENAME):latest"

