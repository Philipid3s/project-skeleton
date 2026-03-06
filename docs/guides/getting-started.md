# Getting Started

## Prerequisites

- Docker 24+ (recommended for first run)
- Git

Optional (if running without Docker):
- Frontend runtime/toolchain chosen for your operator or user interface
- Backend or worker runtime/toolchain chosen for your API and agent executors

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

The provided containers are placeholders. Replace Dockerfiles and startup
commands after selecting your implementation stack, while keeping the baseline
runtime contracts in `docs/specs/technical/agent-runtime/`.

## Local Development (Without Docker)

Set up `frontend/` and `backend/` using your selected languages/frameworks, then
run each service with its own native dev command.

## Testing

Define and document test commands for all implemented services once your stack
is chosen. Keep docs, CI, and the agent contracts in sync.
