# QA Reports

This folder stores compliance reports produced by the `qa-agent`.

## Naming Convention

```
qa-YYYY-MM-DD[-N].md
```

Use the optional `-N` suffix when multiple reports are produced on the same day.

## Purpose

Each report records whether the implementation at a given point in time is consistent
with the functional and technical specifications. Reports are never deleted — they
form an audit trail of QA checks over the project lifecycle.

## Ownership

Reports are written exclusively by `qa-agent`. No other agent modifies this folder.
