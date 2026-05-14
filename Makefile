.PHONY: pull onboard up down logs status dashboard token certs audit audit-fix

certs:
	mkdir -p certs
	mkcert -cert-file certs/cert.pem -key-file certs/key.pem 192.168.1.216 localhost 127.0.0.1

pull:
	docker compose pull

onboard:
	docker compose run --rm --no-deps --entrypoint node openclaw-gateway \
		dist/index.js onboard --mode local --no-install-daemon

up:
	docker compose up -d openclaw-gateway nginx

down:
	docker compose down

logs:
	docker compose logs -f openclaw-gateway

status:
	docker compose run --rm openclaw-cli status

dashboard:
	docker compose run --rm openclaw-cli dashboard --no-open

token:
	@TOKEN=$$(grep OPENCLAW_GATEWAY_TOKEN .env 2>/dev/null | cut -d= -f2); \
	if [ -z "$$TOKEN" ]; then \
		TOKEN=$$(openssl rand -hex 32); \
		echo "OPENCLAW_GATEWAY_TOKEN=$$TOKEN" >> .env; \
		echo "Generated new token."; \
	fi; \
	echo "http://127.0.0.1:18789/#token=$$TOKEN"

audit:
	docker compose run --rm openclaw-cli security audit --deep

audit-fix:
	docker compose run --rm openclaw-cli security audit --fix
