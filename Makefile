.PHONY: pull onboard up down logs status dashboard

pull:
	docker compose pull

onboard:
	docker compose run --rm --no-deps --entrypoint node openclaw-gateway \
		dist/index.js onboard --mode local --no-install-daemon

up:
	docker compose up -d openclaw-gateway

down:
	docker compose down

logs:
	docker compose logs -f openclaw-gateway

status:
	docker compose run --rm openclaw-cli status

dashboard:
	docker compose run --rm openclaw-cli dashboard --no-open
