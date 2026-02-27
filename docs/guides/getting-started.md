# Getting Started

## Prerequisites

- Docker 24+ (recommended for first run)
- Git

Optional (if running without Docker):
- Any frontend runtime/toolchain you choose later
- Any backend runtime/toolchain you choose later

## Quick Start (Docker)

```bash
# 1. Clone repository
git clone <repo-url>
cd <project>

# 2. Create local env files
cp .env.example .env
cp frontend/.env.example frontend/.env.local
cp backend/.env.example backend/.env

# 3. Start template services
docker compose -f docker-compose.dev.yml up --build
```

The provided containers are placeholders. Replace Dockerfiles and startup commands after selecting your stack.

## Local Development (Without Docker)

Set up `frontend/` and `backend/` using your selected languages/frameworks, then run each app with its own native dev command.

## Testing

Define and document test commands for both services once your stack is chosen. Keep docs and CI in sync.
