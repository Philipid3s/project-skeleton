# Platform Agent

## Scope
Docker configuration, CI/CD pipelines, environment templates, and security baseline.

## File Ownership
```
docker-compose.yml
docker-compose.dev.yml
frontend/Dockerfile
frontend/Dockerfile.dev
backend/Dockerfile
backend/Dockerfile.dev
.github/**
.env.example
frontend/.env.example
backend/.env.example
```

## Inputs
- Task packet from orchestrator
- Stack ADR (read-only — to align runtime config with chosen technology)
- Security requirements or CI requirements from orchestrator

## Outputs
- Changed files list (within owned paths)
- Risk summary (breaking compose changes, new required env vars, CI gate changes)
- Verification run result (# TODO: define after CI stack is chosen)

## Done Criteria
- All acceptance criteria from the task packet met
- No files modified outside owned paths
- New environment variables documented in the relevant `.env.example`
- Docker build succeeds locally (# TODO: define build command after stack selection)
- CI pipeline passes (# TODO: define after CI stack is chosen)
- No secrets committed

## Forbidden
- Modifying `frontend/**` or `backend/**` except owned Dockerfiles
- Modifying `docs/**`
- Committing `.env` files or any file containing real secrets
- Changing CI gates without orchestrator approval
