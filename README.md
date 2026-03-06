# AI-Agent System Skeleton

Opinionated starter template for building AI-agent systems with a built-in
multi-agent development workflow: orchestrator + specialist agents (frontend,
backend, docs, platform, QA), defined ownership boundaries, and a default agent
runtime contract.

## Goals

- Provide a strong baseline for agent task execution, tool calling, retries,
  and memory management.
- Keep implementation-stack choices explicit and reviewable through ADRs.
- Provide consistent docs, ADRs, runtime specs, API contracts, and container
  templates from day one.

## Quick Start

```bash
git clone <repo-url> && cd <project>
cp .env.example .env
cp frontend/.env.example frontend/.env.local
cp backend/.env.example backend/.env
docker compose -f docker-compose.dev.yml up --build
```

The default service containers are placeholders around an active agent-runtime
baseline. Replace them with your chosen implementation stack while preserving
the runtime contracts in `docs/specs/technical/agent-runtime/`.

## Project Structure

```text
.
|-- frontend/                 # Frontend UI for operators or end users
|-- backend/                  # APIs, workers, and domain logic
|-- docs/
|   |-- adr/                  # Architecture Decision Records
|   |-- api/                  # OpenAPI contract
|   |-- specs/
|   |   `-- technical/
|   |       `-- agent-runtime/ # Core task/tool/retry/state specs
|   `-- guides/               # Team guides and onboarding docs
|-- docker-compose.yml        # Production compose template
`-- docker-compose.dev.yml    # Development compose template
```

## How To Use This Template

1. Rename the template to your project name and remove skeleton-specific clone
   links or repository references.
2. Review ADR 0002, ADR 0003, and ADR 0004 to understand the default
   multi-agent and runtime architecture.
3. Choose the implementation stack for the frontend, backend, workers, and
   deployment tooling.
4. Replace `frontend/Dockerfile*` and `backend/Dockerfile*`.
5. Implement services around the runtime baseline documented in
   `docs/specs/technical/agent-runtime/`.
6. Update `docs/api/openapi.yml` and add ADRs in `docs/adr/` for stack choices
   and major architecture decisions.

## Contributing

1. Branch from `master`.
2. Use the PR template in `.github/PULL_REQUEST_TEMPLATE.md`.
3. Add an ADR in `docs/adr/` for major architecture decisions.
