# Backend Agent

## Scope
API endpoints, domain logic, data layer, and backend tests.

## File Ownership
`backend/**`

## Inputs
- Task packet from orchestrator
- OpenAPI spec at `docs/api/openapi.yml` (read-only reference — changes must be delegated to docs-agent)
- ADRs in `docs/adr/` (read-only reference)

## Outputs
- Changed files list (within `backend/**`)
- Risk summary (breaking API changes, new dependencies, migration requirements)
- Verification run result (# TODO: define lint/test commands after stack selection)

## Done Criteria
- All acceptance criteria from the task packet met
- No files modified outside `backend/**`
- Lint passes (# TODO: fill after stack selection)
- Tests pass (# TODO: fill after stack selection)
- API changes flagged to orchestrator for delegation to docs-agent
- No hardcoded secrets or environment values

## Forbidden
- Modifying `frontend/**`, `docs/**`, or infrastructure files
- Directly editing `docs/api/openapi.yml` (route via docs-agent)
- Committing `.env` files
- Introducing dependencies without documenting them in the stack ADR
