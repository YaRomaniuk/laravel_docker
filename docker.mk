include .env

.PHONY: up down stop prune ps shell artisan npm build logs

default: up

WP_ROOT ?= /var/www/html/

## help	:	Print commands help.
help : docker.mk
	@sed -n 's/^##//p' $<

## build
build:
	docker-compose up -d --build
	docker-compose run --rm composer update
	cp -n www/.env.example www/.env || true

## artisan
#artisan:
#	docker-compose run --rm artisan $(filter-out $@,$(MAKECMDGOALS))
artisan:
	docker-compose run --rm artisan $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

## npm
npm:
	docker-compose run --rm node npm run $(filter-out $@,$(MAKECMDGOALS))

## up	:	Start up containers.
up:
	@echo "Starting up containers for $(PROJECT_NAME)..."
	docker-compose pull
	docker-compose up -d --remove-orphans

## down	:	Stop containers.
down: stop

## start	:	Start containers without updating.
start:
	@echo "Starting containers for $(PROJECT_NAME) from where you left off..."
	@docker-compose start

## stop	:	Stop containers.
stop:
	@echo "Stopping containers for $(PROJECT_NAME)..."
	@docker-compose down

## prune	:	Remove containers and their volumes.
##		You can optionally pass an argument with the service name to prune single container
##		prune mariadb	: Prune `mariadb` container and remove its volumes.
##		prune mariadb solr	: Prune `mariadb` and `solr` containers and remove their volumes.
prune:
	@echo "Removing containers for $(PROJECT_NAME)..."
	@docker-compose down -v $(filter-out $@,$(MAKECMDGOALS))

## ps	:	List running containers.
ps:
	@docker ps --filter name='$(PROJECT_NAME)*'

## shell	:	Access `php` container via shell.
shell:
	docker exec -ti -e COLUMNS=$(shell tput cols) -e LINES=$(shell tput lines) $(shell docker ps --filter name='$(PROJECT_NAME)_php' --format "{{ .ID }}") sh

logs:
	@docker-compose logs -f $(filter-out $@,$(MAKECMDGOALS))

# https://stackoverflow.com/a/6273809/1826109
%:
	@:
