# Security

## Secrets

- Do not commit real `.env` files, API keys, tokens, certificates, or private
  credentials.
- Document required variables in `.env.example` files.
- Redact secrets from prompts, issue reports, screenshots, logs, and session
  notes before sharing them with AI tools or external systems.

## Agentic Development

- Ask before running destructive commands, changing deployment infrastructure,
  or modifying authentication and permission behavior.
- Prefer least-privilege credentials and read-only access for exploratory work.
- Treat generated code like any other code: review it, test it, and check its
  security impact before merging.

## Reporting

For a real project, replace this section with the responsible contact, supported
versions, and vulnerability reporting process.
