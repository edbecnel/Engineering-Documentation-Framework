# Database Documentation

## Purpose

This directory documents the **data layer** — schemas, relationships, migration strategy, and data governance. Accurate database documentation prevents silent data corruption, speeds up reporting and analytics work, and gives AI tools safe context for query and migration tasks.

## Audience

- Backend engineers and data engineers
- DBAs and operations staff
- Analysts needing schema understanding
- Security and compliance reviewers
- AI tools assisting with migrations or query optimization

## What belongs here

| Document type | Examples |
|---------------|----------|
| Entity-relationship diagrams | ERD source files and exports |
| Schema reference | Tables, columns, types, constraints |
| Migration guide | Tooling, naming, expand–contract patterns |
| Index strategy | Performance-critical indexes and rationale |
| Data dictionary | Business meaning of fields |
| Backup and restore | Procedures (high level; secrets in Deployment) |
| Retention and PII | What data is stored, how long, classification |

## What does not belong here

- Application connection strings or credentials → secret manager / [docs/Deployment/](../Deployment/)
- Architecture decision rationale → [ARCHITECTURE_DECISIONS.md](../../ARCHITECTURE_DECISIONS.md) (link from here)
- Raw production data dumps → never in Git

## Suggested document structure

### Schema overview (`Schema_Overview.md`)

```markdown
# Database Schema Overview

## Technology
[PostgreSQL 16, Redis, etc.]

## Databases / schemas
[List with purpose]

## ER diagram
[Mermaid or link to diagrams/]

## Conventions
Naming, primary keys, soft delete, timestamps.
```

### Table documentation template

```markdown
## table_name

**Purpose:** [Business description]

| Column | Type | Nullable | Description |
|--------|------|----------|-------------|

**Indexes:** [List]
**Foreign keys:** [List]
**Owner:** [Team]
```

## Migration documentation

Document in `Migrations.md`:

- Migration tool: _[Flyway, Liquibase, Alembic, Rails, etc.]_
- File naming convention
- Review requirements for production
- Rollback limitations
- Zero-downtime patterns used by the team

## Recommended files (as project grows)

| File | Description |
|------|-------------|
| `Schema_Overview.md` | Entry point with ERD |
| `Migrations.md` | How migrations are authored and applied |
| `Data_Dictionary.md` | Business definitions |
| `diagrams/` | ERD source files |

## AI-assisted database work

When using AI for SQL or migrations:

- Provide schema docs from this folder, not production data.
- Human review required for all production migrations.
- See [docs/Developer_Handbook/02_AI_Development.md](../Developer_Handbook/02_AI_Development.md).

## Maintenance

| Field | Value |
|-------|-------|
| **Owner** | _[Data owner / DBA]_ |
| **Review cadence** | Every schema change; quarterly ERD accuracy check |
| **Index** | [PROJECT_INDEX.md](../../PROJECT_INDEX.md) |

## Related documents

- [docs/Architecture/](../Architecture/)
- [docs/Developer_Handbook/06_Deployment.md](../Developer_Handbook/06_Deployment.md)
- [docs/Deployment/](../Deployment/) — runtime database operations
