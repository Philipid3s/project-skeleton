# Getting Started

## Prerequisites

- Docker 24+ (recommended for first run)
- Git

Optional (if running without Docker):
- Frontend runtime/toolchain chosen for your UI
- Backend runtime/toolchain chosen for your API

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
commands after selecting your implementation stack.

## Project Kickoff

When using this skeleton for a real project:

1. Replace `your-project-name`, `starter-app`, and generic API titles with the
   real project identity.
2. Choose the frontend and backend stack.
3. Replace placeholder Dockerfiles and Compose service commands.
4. Define stack-specific lint, test, build, and local startup commands.
5. Update `AGENTS.md`, `README.md`, `.env.example`, and `docs/api/openapi.yml`.
6. Add an ADR for major choices such as framework, database, auth, deployment,
   or background worker architecture.

## Local Development (Without Docker)

Set up `frontend/` and `backend/` using your selected languages/frameworks, then
run each service with its own native dev command.

## Testing

Define and document test commands for all implemented services once your stack
is chosen. Keep docs, CI, and the implementation in sync.

Until a real stack is selected, use the template verification command:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/verify-template.ps1
```
