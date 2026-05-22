# Security

## Secrets

- Do not commit real `.env` files, API keys, tokens, certificates, or private
  credentials.
- Document required variables in `.env.example` files.
- Redact secrets from prompts, issue reports, screenshots, logs, and session
  notes before sharing them with AI tools or external systems.

## Agentic Development

- Ask before running destructive commands, changing deployment infrastructure,
  or modifying authentication and permission behavior.
- Prefer least-privilege credentials and read-only access for exploratory work.
- Treat generated code like any other code: review it, test it, and check its
  security impact before merging.

## Reviewing Agent-Generated Code

When reviewing a PR that includes agent-generated changes, check:

- **Secrets:** No real credentials, tokens, or keys were introduced. Env vars
  use `.env.example`, not hardcoded values.
- **Scope creep:** Changes are limited to what was requested. Extra files,
  refactors, or new abstractions were not silently added.
- **Destructive paths:** No `rm -rf`, force-push, schema drops, or overwrite
  of uncommitted work hidden inside scripts or CI steps.
- **Injection surfaces:** User-controlled input is validated at system
  boundaries (SQL, shell, HTML). No new XSS, SQLi, or command-injection risk.
- **ADRs updated:** Any framework, database, auth, or deployment decision made
  during generation is recorded in `docs/adr/`.
- **AGENTS.md current:** If the agent changed setup steps, commands, or
  workflow, the instruction files reflect that.

## Reporting

For a real project, replace this section with the responsible contact, supported
versions, and vulnerability reporting process.
