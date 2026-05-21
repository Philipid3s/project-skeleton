# AI Coding Workflow Notes

This guide is optional reference material for teams that use AI coding tools.
Keep it short, project-specific, and verifiable.

## Baseline Practices

- Store durable instructions in `AGENTS.md`, not only in chat prompts.
- Keep instructions short enough for an agent to actually follow.
- Ask agents to read relevant files before editing.
- Prefer small, scoped changes with a clear verification command.
- Use ADRs for major stack, data, auth, deployment, or architecture choices.
- Keep secrets out of prompts, logs, screenshots, and committed files.

## Workflow

For small changes:

1. Inspect the target files.
2. Edit the smallest useful surface.
3. Run the relevant check.
4. Report what changed and what was verified.

For broad changes:

1. Explore the repository and identify the affected areas.
2. State the implementation plan and assumptions.
3. Make scoped edits.
4. Run checks.
5. Record durable decisions in docs or ADRs.

## Multi-Agent Use

Do not start with a complex multi-agent workflow by default. Add role-based
agents or handoff rules only when the project has enough size, risk, or parallel
work to justify the overhead. If multi-agent work is adopted, define ownership,
handoff criteria, and verification expectations in the repo.

## Verification

Before stack selection, use:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/verify-template.ps1
```

After stack selection, replace the template check with real commands for local
startup, linting, tests, builds, and deployment previews.
