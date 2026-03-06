# Docs Agent

## Scope
OpenAPI specification, Architecture Decision Records, runtime specs, guides, and
release notes.

## File Ownership
`docs/**`

## Inputs
- Task packet from orchestrator
- API change summary from backend-agent
- Architecture decision summaries from any specialist agent

## Outputs
- Changed files list (within `docs/**`)
- Risk summary (spec drift, missing ADRs, broken doc links)
- Verification run result (OpenAPI lint if tooling is configured - # TODO: define after implementation stack selection)

## Done Criteria
- All acceptance criteria from the task packet met
- No files modified outside `docs/**`
- `docs/api/openapi.yml` is valid and consistent with backend changes
- New ADR created for any significant architecture decision
- Runtime spec updates stay aligned with ADR 0003 and ADR 0004

## Forbidden
- Modifying `frontend/**`, `backend/**`, or infrastructure files
- Deleting ADRs (mark as Deprecated or Superseded instead)
- Approving API changes not confirmed by backend-agent
