DOCKER_COMPOSE = COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose
DOCKER_APP_EXEC = $(DOCKER_COMPOSE) exec app

start:
	${DOCKER_COMPOSE} up -d

stop:
	${DOCKER_COMPOSE} down

install:
ifeq (,$(wildcard ./.env))
	cp .env.example .env
	$(DOCKER_APP_EXEC) php artisan key:generate
else
	@echo "ENV already exists"
endif
ifeq (,$(wildcard ./vendor/))
	$(DOCKER_APP_EXEC) /usr/bin/composer install
else
	@echo "Composer already installed"
endif

exec-php:
	$(DOCKER_APP_EXEC) sh

exec-mysql:
	$(DOCKER_COMPOSE) exec mysql mysql -u${DB_USERNAME:-laravel} -p${DB_PASSWORD:-password} ${DB_DATABASE:-laravel}

logs:
	$(DOCKER_COMPOSE) logs -f

build:
	${DOCKER_COMPOSE} build --no-cache
