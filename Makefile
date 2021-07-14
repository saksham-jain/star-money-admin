SHELL:=/bin/bash

up:
	@docker-compose up

upd:
	@docker-compose up -d

down:
	@docker-compose down

heroku-push:
	@heroku container:push web
	@heroku container:release web