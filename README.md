# Project Skeleton

Stack-agnostic full-stack starter template with a built-in multi-agent AI workflow — orchestrator + specialist agents (frontend, backend, docs, platform, QA) with defined ownership and handoff protocols.

## Goals

- Keep architecture and process structure ready from day one.
- Delay language and framework decisions until project kickoff.
- Provide consistent docs, ADR, API spec, and container placeholders.

## Quick Start

```bash
git clone <repo-url> && cd <project>
cp .env.example .env
cp frontend/.env.example frontend/.env.local
cp backend/.env.example backend/.env
docker compose -f docker-compose.dev.yml up --build
```

The default service containers are placeholders and must be replaced once your stack is chosen.

## Project Structure

```text
.
|-- frontend/                 # Frontend codebase (chosen later)
|-- backend/                  # Backend codebase (chosen later)
|-- docs/
|   |-- adr/                  # Architecture Decision Records
|   |-- api/                  # OpenAPI contract
|   |-- specs/                # Functional and technical specs
|   `-- guides/               # Team guides and onboarding docs
|-- docker-compose.yml        # Production compose template
`-- docker-compose.dev.yml    # Development compose template
```

## How To Use This Template

1. Pick frontend and backend stacks.
2. Replace `frontend/Dockerfile*` and `backend/Dockerfile*`.
3. Implement app entrypoints and package management in each service folder.
4. Update `docs/api/openapi.yml` and add ADRs in `docs/adr/`.

## Contributing

1. Branch from `master`.
2. Use the PR template in `.github/PULL_REQUEST_TEMPLATE.md`.
3. Add an ADR in `docs/adr/` for major architecture decisions.
