SHELL:=/bin/bash

up:
	@docker-compose up

upd:
	@docker-compose up -d

down:
	@docker-compose down

bash:
	@docker-compose run --rm web bash

attach:
	@docker attach star-money_web_1

fast-push:
	@git add .
	@git commit -m "Fast Push"
	@git push
	heroku-push

heroku-push:
	@heroku container:push web
	@heroku container:release web