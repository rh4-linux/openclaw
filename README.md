# OpenClaw

Runs [OpenClaw](https://openclaw.ai) AI assistant gateway in Docker using the pre-built image.

## Setup

```bash
cp .env.example .env
make pull
make onboard
```

## Commands

| Command          | Description                        |
|------------------|------------------------------------|
| `make pull`      | Pull latest image                  |
| `make onboard`   | First-time interactive setup       |
| `make up`        | Start the gateway                  |
| `make down`      | Stop the gateway                   |
| `make logs`      | Tail gateway logs                  |
| `make status`    | Show instance status               |
| `make dashboard` | Print dashboard URL with auth token |

Open http://localhost:18789 after `make up`.
