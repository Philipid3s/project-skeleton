# Full-Stack Project Skeleton

Minimal starter for a backend service plus a frontend app.

## What You Get

- `frontend/` for the UI
- `backend/` for APIs, workers, and domain logic
- `docs/` for architecture notes, API docs, and project guidance
- `docker-compose.yml` and `docker-compose.dev.yml` as deployment templates
- `.env.example` files to document required environment variables
- `AGENTS.md` for lightweight AI coding-agent instructions
- `SECURITY.md` for baseline secret-handling and agent safety rules
- `scripts/verify-template.ps1` for template-level checks before stack selection

## Use It For

- Starting a new full-stack project
- Choosing your own frontend and backend stack
- Adding tests, CI, and deployment once the stack is selected

## Quick Start

```bash
git clone <repo-url>
cd <project>
cp .env.example .env
cp frontend/.env.example frontend/.env.local
cp backend/.env.example backend/.env
docker compose -f docker-compose.dev.yml up --build
```

The Dockerfiles and service commands are placeholders. Replace them with your
chosen stack before treating the project as runnable.

## Project Structure

```text
.
|-- frontend/      # Frontend app
|-- backend/       # Backend service
|-- docs/          # Architecture, specs, and guides
|-- docker-compose.yml
`-- docker-compose.dev.yml
```

## Repository Rules

- Keep architecture decisions in `docs/adr/`
- Document environment variables in `.env.example` files
- Never commit real `.env` files or secrets
- Keep changes small and verifiable

## Template Verification

Before selecting a stack, run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/verify-template.ps1
```

After selecting a frontend and backend stack, replace this with real lint, test,
build, and deployment checks.

## Optional AI-Agent Workflow

This repository also includes optional agentic workflow notes under `docs/`
for teams that want to use AI coding agents with stronger coordination and
ownership rules. They are not required for a normal backend/frontend starter.
