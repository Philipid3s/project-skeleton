# AGENTS.md

Universal agent instructions for this repository.
Consumed by OpenAI Codex (`AGENTS.md`) and Claude Code (imported via `@AGENTS.md` in `CLAUDE.md`).

---

## Project Overview

AI-agent system skeleton with a built-in multi-agent development workflow and a
default runtime baseline for task execution, tool calling, retries, and memory
management.

## Architecture

| Layer    | Path        | Role                                    |
|----------|-------------|-----------------------------------------|
| Frontend | `frontend/` | Operator or end-user UI                 |
| Backend  | `backend/`  | APIs, workers, and business logic       |
| Docs     | `docs/`     | ADRs, runtime specs, API specs, guides  |

## Development Commands

### Start (dev)
```bash
docker compose -f docker-compose.dev.yml up --build
```

### Frontend and Backend
Use language/framework-specific commands after selecting the implementation
stack for the UI, API, and agent workers.

### Tests
Define and document service test commands for the chosen implementation stack.

## Code Conventions

- All new architecture decisions -> `docs/adr/` (use ADR format)
- Runtime contract and memory model changes -> update `docs/specs/technical/agent-runtime/`
- API changes -> update `docs/api/openapi.yml`
- Environment variables -> document in `.env.example` files
- Never commit `.env` files

## Key Files

| File                     | Purpose                               |
|--------------------------|---------------------------------------|
| `docker-compose.yml`     | Production compose template           |
| `docker-compose.dev.yml` | Development compose template          |
| `docs/adr/`              | Architecture Decision Records         |
| `docs/specs/technical/agent-runtime/` | Core runtime contract and state model |
| `docs/api/openapi.yml`   | OpenAPI specification                 |
| `.env.example`           | Root environment variable reference   |

## Multi-Agent Workflow

This project uses an **orchestrator + specialist agents** model.
See [ADR 0002](docs/adr/0002-multi-agent-pattern.md) for the decision record.

| Agent | Owned paths | Contract |
|---|---|---|
| orchestrator | `**` (conflict resolution only) | [orchestrator.md](docs/agents/orchestrator.md) |
| frontend-agent | `frontend/**` | [frontend-agent.md](docs/agents/frontend-agent.md) |
| backend-agent | `backend/**` | [backend-agent.md](docs/agents/backend-agent.md) |
| docs-agent | `docs/**` | [docs-agent.md](docs/agents/docs-agent.md) |
| platform-agent | compose, service Dockerfiles, CI, env templates | [platform-agent.md](docs/agents/platform-agent.md) |
| qa-agent | read-only on specs + implementation, writes to `docs/reports/` and `tests/acceptance/` | [qa-agent.md](docs/agents/qa-agent.md) |

Machine-readable ownership map: [`docs/agents/ownership.yml`](docs/agents/ownership.yml)

Each agent operates only within its declared paths. The orchestrator is the sole
resolver of cross-area conflicts. Every delegated task must follow the handoff
format defined in [orchestrator.md](docs/agents/orchestrator.md).

## Role Signaling Convention

Most chat interfaces show only one assistant stream. To make the active role
visible, agent outputs should label themselves explicitly.

- Start orchestration messages with `Role: orchestrator`
- Start specialist-style messages with `Role: <agent-name>`
- Use the same label in handoff files, QA reports, and other durable outputs
- When the orchestrator summarizes specialist work, it should state which agent
  perspective produced each result

Example labels:
- `Role: orchestrator`
- `Role: backend-agent`
- `Role: docs-agent`

**Session continuity:** At the end of a long session or before starting a new one,
the orchestrator writes a session handoff file to `docs/sessions/` using the template
at `docs/sessions/handoff-template.md`. Every new session on in-progress work must
start by reading the latest handoff file.

## Agent Behavior Guidelines

- Prefer editing existing files over creating new ones.
- Do not commit `.env` or secrets.
- Before modifying a file, read it first to understand context.
- Keep solutions minimal and avoid over-engineering.
- When adding architecture decisions, create a new ADR in `docs/adr/`.
- Respect file ownership defined in `docs/agents/ownership.yml`.
