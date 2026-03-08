# GEMINI.md

Gemini CLI entrypoint for this repository.
The canonical multi-agent instructions live in [`AGENTS.md`](AGENTS.md) so the
same workflow can be used from other agentic IDEs and CLIs.

---

## Gemini CLI Specific Instructions

- Adhere to the orchestrator + specialist model defined in [`AGENTS.md`](AGENTS.md).
- Follow the file ownership boundaries in [`docs/agents/ownership.yml`](docs/agents/ownership.yml).
- Use the `Role: <agent-name>` signaling convention for all outputs.
- Before ending a session, trigger the handoff process to update [`docs/sessions/`](docs/sessions/).

## Workflow Integration

When acting as an agent in this repo, always:
1. **Identify Role:** Start by determining if you are acting as the `orchestrator` or a `specialist-agent` based on the task.
2. **Consult ADRs:** Check [`docs/adr/`](docs/adr/) for existing architecture decisions before suggesting changes.
3. **Verify Contracts:** Ensure any tool or task implementations match the schemas in [`docs/specs/technical/agent-runtime/`](docs/specs/technical/agent-runtime/).
4. **Sign Off:** Use the session handoff trigger (`handoff session` or similar) when concluding work to ensure continuity.
