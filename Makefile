start:
	docker-compose up -d

stop:
	docker-compose down

restart:
	docker-compose down && docker-compose up -d

build:
	docker-compose up -d --build

logs:
	docker-compose logs -f

bash:
	docker-compose exec app bash
