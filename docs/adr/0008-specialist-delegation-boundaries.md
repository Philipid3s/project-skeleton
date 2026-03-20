# ADR 0008: Specialist Delegation Boundaries and Least-Privilege Execution

## Status
Accepted

## Date
2026-03-20

## Context
This repository defines an orchestrator plus specialist-agent workflow and is
intended for AI-agentic development across host runtimes with varying native
delegation features. Without explicit delegation boundaries for specialists,
agent behavior can drift into recursive delegation, cross-scope edits, unclear
ownership, and overly broad tool or permission use.

The repository already defines specialist ownership and orchestrator-led task
handoffs, but those controls need an explicit delegation policy that remains
valid whether the runtime exposes `spawn_agent`, Claude Code subagents, or a
future native delegation mechanism.

## Decision
Adopt the following delegation rules for specialist agents:

1. Orchestrator-led repository delegation
   - Repository-role delegation remains orchestrator-owned.
   - Specialists must not create new repository-role delegates or reassign work
     across ownership domains on their own.

2. Flat delegation preference
   - Prefer a flat delegation tree.
   - Recursive specialist-to-specialist delegation is forbidden by repository
     policy, even if the host runtime technically permits nested delegation.

3. Least-privilege execution
   - Delegated helpers should receive the minimum context, tools, and
     permissions needed for the task.
   - Read-only exploration should prefer read-only helpers.
   - Elevated or bypassed permission modes require explicit human approval.

4. Scoped outputs
   - Delegated helpers must return concise summaries with changed files, risks,
     blockers, and verification results.
   - Work outside the specialist's owned scope must be returned to the
     orchestrator as a follow-up need, not handled through ad hoc delegation.

5. Fallback consistency
   - In runtimes without native delegation, specialists still follow the same
     ownership and scope rules while working in a single session.

## Consequences
Positive:
- Delegation remains auditable and consistent across runtimes.
- Ownership boundaries are preserved even when sub-agent features exist.
- Context usage, tool access, and approval handling stay closer to least
  privilege and current agent-safety practice.

Trade-offs:
- Specialists may need to route more follow-up work back through the
  orchestrator, which adds coordination overhead.
- Some runtimes may allow technically possible delegation patterns that this
  repository intentionally forbids.
