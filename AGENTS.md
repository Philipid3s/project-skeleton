# AGENTS.md

Universal agent instructions for this repository.

## Project Overview

This repository is a basic backend + frontend starter. Treat the codebase as a
generic template unless a project-specific file says otherwise.

## Repository Conventions

- Read the target files before editing them.
- Keep changes minimal and easy to verify.
- Prefer existing files over new files when both work.
- Document major architecture decisions in `docs/adr/`.
- Document environment variables in the relevant `.env.example` file.
- Never commit real `.env` files or secrets.
- Update docs when behavior, setup, or contracts change.
- Follow `SECURITY.md` for secret handling and risky operations.
- Ask for the project name before replacing the skeleton identity unless the
  user already provided it.
- Treat dependency, framework, database, deployment, and auth choices as
  architecture decisions that need documentation.

## Agent Workflow

Use the smallest workflow that fits the request:

- For small, clear edits, inspect the target files, make the change, then verify.
- For broad or ambiguous work, explore first, state the plan, then implement.
- For risky changes, surface assumptions before editing.
- Keep generated context out of the repo unless it belongs in docs.

## Optional AI-Agent Material

The `docs/guides/agentic-development.md` and `docs/agents/README.md` files are
optional reference material for teams that want extra structure around AI coding
agents. They are not required for a normal starter project.

## Verification

If the repository has stack-specific tests or build commands, run them after
making a change and report the result. If no runnable stack exists yet, keep the
change clearly marked as a template update.

For template-only changes, run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/verify-template.ps1
```
