#!/bin/bash

UID = $(shell id -u)
DOCKER_BE = store_backend_app
DOCKER_NETWORK= jenkins_app

help: ## Show this help message
	@echo 'usage: make [target]'
	@echo
	@echo 'targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

start: ## Start the containers
	docker network create  $(DOCKER_NETWORK) || true
	U_ID=${UID} docker compose up -d

stop: ## Stop the containers
	U_ID=${UID} docker compose down

restart: ## Restart the containers
	$(MAKE) stop && $(MAKE) start

build: ## Rebuilds all the containers
	docker network create $(DOCKER_NETWORK) || true
	U_ID=${UID} docker compose build --no-cache

ssh: ## bash into the be container
	U_ID=${UID} docker exec -it --user ${UID} ${DOCKER_BE} bash