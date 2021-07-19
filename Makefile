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

heroku-push:
	@heroku container:push web
	@heroku container:release web
	
fast-push:
	@git add .
	@git commit -m "Fast Push"
	@git push origin development
	heroku-push