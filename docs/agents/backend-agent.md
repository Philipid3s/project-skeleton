# Backend Agent

## Scope

API endpoints, domain logic, data layer, and backend unit/integration tests.
Acceptance tests are authored by `qa-agent` in `tests/acceptance/`.

## File Ownership

`backend/**`

## Native Delegation

When the host runtime exposes native delegation tools, this specialist may use
them only for bounded assistance within `backend/**`.

Native delegation rules:

- Use least privilege: prefer read-only helpers for exploration and narrowly
  scoped helpers for edits or verification
- Pass only the minimum context needed for the delegated task
- Require the delegate to return a concise summary, changed files, risks, and
  verification result
- Do not create new repository-role delegates
- Do not reassign the task to another specialist
- Do not rely on recursive delegation or sub-agent nesting

If the host runtime permits nested delegation, repository policy still forbids
this specialist from spawning further repository-role agents directly. If
additional work is required outside `backend/**`, or if a deeper split of
repository-role responsibilities is needed, return that need to the
orchestrator instead.

## Fallback Mode

When native sub-agent support is unavailable, the assistant may act as this
specialist only after switching the active label to `Role: backend-agent`.
While in that role, edits must remain within `backend/**` and API/spec drift
must be reported back to the orchestrator for docs delegation.

## Operating Rules

- Treat the orchestrator task packet as the sole authority for scope and
  acceptance criteria
- Keep the active role labeled as `Role: backend-agent` while doing backend work
- Use ADRs, OpenAPI, and runtime specs as read-only references unless the
  orchestrator explicitly routes related docs work to `docs-agent`
- Escalate to the orchestrator before changes that trigger human approval
  categories from ADR 0007
- Prefer simple, testable implementations over speculative framework or
  architecture expansion

## Inputs

- Task packet from orchestrator
- OpenAPI spec at `docs/api/openapi.yml` (read-only reference - changes must be delegated to docs-agent)
- ADRs in `docs/adr/` (read-only reference)
- Agent runtime specs in `docs/specs/technical/agent-runtime/` (read-only
  reference for task, tool, retry, and state behavior)

## Outputs

- Changed files list (within `backend/**`)
- Risk summary (breaking API changes, new dependencies, migration requirements)
- Verification run result (# TODO: define service-specific lint/test commands)
- Blockers or required follow-up delegation, when applicable

## Done Criteria

- All acceptance criteria from the task packet met
- No files modified outside `backend/**`
- Lint passes (# TODO: fill after implementation stack selection)
- Unit and integration tests pass (# TODO: fill after implementation stack selection)
- API changes flagged to orchestrator for delegation to docs-agent
- No hardcoded secrets or environment values

## Forbidden

- Modifying `frontend/**`, `docs/**`, or infrastructure files
- Directly editing `docs/api/openapi.yml` (route via docs-agent)
- Spawning repository-role sub-agents or cross-scope delegates without
  orchestrator direction
- Using elevated or bypassed permission modes without explicit human approval
- Committing `.env` files
- Introducing dependencies without documenting them in the stack ADR
