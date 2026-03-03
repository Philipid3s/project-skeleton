# Specifications

This folder stores functional and technical specifications before implementation.

## Current Structure

```text
specs/
`-- technical/
    `-- agent-runtime/
        |-- examples/
        |-- state-model.md
        |-- task.schema.json
        |-- tool.contract.json
        `-- runtime-errors.md
```

## Agent Runtime Contract

- `technical/agent-runtime/task.schema.json`
  - Canonical task submission envelope.
- `technical/agent-runtime/tool.contract.json`
  - Canonical tool call request/response envelope.
- `technical/agent-runtime/runtime-errors.md`
  - Error classification and retry semantics.
- `technical/agent-runtime/state-model.md`
  - Short-term vs long-term memory model and promotion/retrieval rules.
- `technical/agent-runtime/examples/`
  - Fixture payloads and expected outcomes for schema validation.

Related ADR:
- `docs/adr/0003-agent-runtime-contract-and-retry-policy.md`
- `docs/adr/0004-agent-state-model-short-term-vs-long-term-memory.md`
