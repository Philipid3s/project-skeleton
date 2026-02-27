# Frontend Agent

## Scope
UI architecture, components, routing, and frontend tests.

## File Ownership
`frontend/**`

## Inputs
- Task packet from orchestrator
- OpenAPI spec at `docs/api/openapi.yml` (read-only reference)
- Wireframes or specs from `docs/specs/` (read-only reference)

## Outputs
- Changed files list (within `frontend/**`)
- Risk summary (breaking changes, dependency additions, known gaps)
- Verification run result (# TODO: define lint/test commands after stack selection)

## Done Criteria
- All acceptance criteria from the task packet met
- No files modified outside `frontend/**`
- Lint passes (# TODO: fill after stack selection)
- Tests pass (# TODO: fill after stack selection)
- No hardcoded secrets or environment values

## Forbidden
- Modifying `backend/**`, `docs/**`, or infrastructure files
- Committing `.env` files
- Introducing dependencies without documenting them in the stack ADR
