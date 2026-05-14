# OpenClaw

Runs [OpenClaw](https://openclaw.ai) AI assistant gateway in Docker using the pre-built image, with nginx HTTPS reverse proxy for LAN access.

## Setup

```bash
cp .env.example .env
make pull
make certs    # generate mkcert certs (requires mkcert installed)
make onboard
```

### Install mkcert (first time only)

```bash
sudo apt install mkcert libnss3-tools
mkcert -install
```

Then install the CA cert on each client device that needs to access the UI.

## Commands

| Command          | Description                                      |
|------------------|--------------------------------------------------|
| `make pull`      | Pull latest image                                |
| `make certs`     | Generate mkcert TLS certs for LAN HTTPS          |
| `make onboard`   | First-time interactive setup                     |
| `make up`        | Start gateway + nginx                            |
| `make down`      | Stop all services                                |
| `make logs`      | Tail gateway logs                                |
| `make status`    | Show instance status                             |
| `make token`     | Print dashboard URL with auth token              |
| `make dashboard` | Print dashboard URL (via CLI container)          |
| `make audit`     | Run deep security audit                          |
| `make audit-fix` | Run security audit with auto-fix                 |

## Access

- HTTPS (LAN): `https://192.168.1.216` → run `make token` for the full URL with token
- Local: `http://127.0.0.1:18789`
