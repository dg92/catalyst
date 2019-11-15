SHELL=/bin/bash

DOCKER_VERSION := $(shell docker --version 2>/dev/null)
DOCKER_COMPOSE_VERSION := $(shell docker-compose --version 2>/dev/null)

ENV_BROWSER_HYDRA_HOST ?= localhost
ENV_BROWSER_CONSUMER_HOST ?= localhost
ENV_BROWSER_IDP_HOST ?= localhost
ENV_BROWSER_OATHKEEPER_PROXY_HOST ?= localhost

ENV_HYDRA_VERSION ?= v1.0.8-alpine
ENV_KETO_VERSION ?= v0.3.6
ENV_OATHKEEPER_VESRION ?= v0.32.1

export HYDRA_VERSION=${ENV_HYDRA_VERSION}
export OATHKEEPER_VERSION=${ENV_OATHKEEPER_VESRION}
export KETO_VERSION=${ENV_KETO_VERSION}

export BROWSER_HYDRA_HOST=${ENV_BROWSER_HYDRA_HOST}
export BROWSER_CONSUMER_HOST=${ENV_BROWSER_CONSUMER_HOST}
export BROWSER_IDP_HOST=${ENV_BROWSER_IDP_HOST}
export BROWSER_OATHKEEPER_PROXY_HOST=${ENV_BROWSER_OATHKEEPER_PROXY_HOST}

start-stack:
	docker-compose build --parallel
	docker-compose -f docker-compose.yml up -d --build

start-stack-metrics:
	docker-compose -f docker-compose.yml -f docker-compose-metrics.yaml up

stop-stack:
	docker-compose stop

build-stack:
	docker-compose build

dbash:
	docker-compose exec ${SVC} bash

dlog:
	docker-compose logs -f --tail="400" ${SVC}

start-code-server:
	docker run -it -p 127.0.0.1:8080:8080 -v "${HOME}/.local/share/code-server:/home/coder/.local/share/code-server" -v "$PWD:/home/coder/project" codercom/code-server:v2