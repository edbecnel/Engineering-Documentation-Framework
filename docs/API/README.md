# API Documentation

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › API


## Purpose

This directory is the **canonical reference for programmatic interfaces** — REST, GraphQL, gRPC, webhooks, SDKs, and internal service contracts. It enables consumers (internal teams, partners, frontend developers, and AI agents) to integrate correctly without reading source code.

## Audience

- Frontend and mobile developers
- External API consumers and partner engineers
- QA engineers writing contract tests
- Technical writers producing public API reference
- AI tools generating client code or integration tests

## What belongs here

| Document type | Examples |
|---------------|----------|
| OpenAPI / Swagger specs | `openapi.yaml`, per-service specs |
| GraphQL schema | `schema.graphql`, federation docs |
| gRPC / Protobuf | `.proto` files and generated doc |
| Authentication guide | OAuth flows, API keys, scopes |
| Versioning policy | Deprecation schedule, breaking change rules |
| Webhook catalog | Events, payloads, retry behavior |
| SDK usage | Client library examples |
| Error reference | Standard error codes and formats |

## What does not belong here

- Why an API technology was chosen → [ARCHITECTURE_DECISIONS.md](../../ARCHITECTURE_DECISIONS.md)
- Infrastructure routing (load balancers, gateways) → [docs/Deployment/](../Deployment/)
- Business requirements → [docs/Specifications/](../Specifications/)
- End-user UI help → [docs/User_Guides/](../User_Guides/)

## Suggested document structure

### API overview (`API_Overview.md`)

```markdown
# API Overview

## Base URLs
| Environment | URL |
|-------------|-----|

## Authentication
[Summary with link to Auth_Guide.md]

## Versioning
[Header or URL strategy]

## Rate limits
[Limits and headers]

## Common patterns
Pagination, filtering, idempotency keys.
```

### Per-endpoint or per-resource docs

Generated from OpenAPI when possible; hand-written supplements for complex flows.

## Quality standards

- **Single source of truth** — Prefer machine-readable specs (OpenAPI) that generate human docs.
- **Sync with code** — API changes and doc updates land in the same PR.
- **Examples** — Every public endpoint should have request/response examples.
- **Stability labels** — Mark endpoints as `stable`, `beta`, or `deprecated`.

## Recommended files (as project grows)

| File | Description |
|------|-------------|
| `openapi.yaml` | Primary REST contract |
| `Authentication.md` | Auth flows and token handling |
| `Versioning_and_Deprecation.md` | Consumer migration guide |
| `Webhooks.md` | Outbound event documentation |
| `changelog-api.md` | API-specific breaking changes (or section in root CHANGELOG) |

## Contract testing

Link contract tests in [docs/Developer_Handbook/05_Testing.md](../Developer_Handbook/05_Testing.md) to specs in this directory.

## Maintenance

| Field | Value |
|-------|-------|
| **Owner** | _[API platform owner]_ |
| **Review cadence** | Every API change; quarterly audit for drift |
| **Index** | [PROJECT_INDEX.md](../../PROJECT_INDEX.md) |

## Related documents

- [docs/Architecture/](../Architecture/)
- [docs/Developer_Handbook/04_Coding_Standards.md](../Developer_Handbook/04_Coding_Standards.md)
- [docs/User_Guides/](../User_Guides/) — consumer-facing how-tos built on these APIs

## Parent

- [Project Index](../../PROJECT_INDEX.md)
