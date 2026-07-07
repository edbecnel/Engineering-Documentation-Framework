# Deployment Documentation

## Purpose

This directory contains **operations and infrastructure documentation** — how the software is built, deployed, configured, monitored, and recovered in each environment. It complements the developer-focused [Developer Handbook deployment guide](../Developer_Handbook/06_Deployment.md) with platform-level detail.

## Audience

- DevOps, SRE, and platform engineers
- Developers with production access
- On-call responders during incidents
- Security auditors reviewing infrastructure controls

## What belongs here

| Document type | Examples |
|---------------|----------|
| Environment inventory | Accounts, clusters, regions, URLs |
| CI/CD pipelines | Workflow descriptions, approval gates |
| Infrastructure as Code | Pointers to Terraform/Pulumi modules (code may live elsewhere) |
| Runbooks | Step-by-step operational procedures |
| Monitoring and alerting | Dashboards, alert rules, escalation |
| Disaster recovery | RTO/RPO, failover procedures |
| Secret management | Where secrets live (not the secrets themselves) |
| Network and access | VPN, bastion, IAM roles |

## What does not belong here

- Local dev setup → [docs/Developer_Handbook/01_Development_Environment.md](../Developer_Handbook/01_Development_Environment.md)
- Application architecture → [docs/Architecture/](../Architecture/)
- API contracts → [docs/API/](../API/)
- Actual credentials, `.env` files, private keys → **never in Git**

## Suggested document structure

### Runbook template (`runbooks/RUNBOOK-template.md`)

```markdown
# Runbook: [Title]

## Overview
What this procedure accomplishes.

## Prerequisites
Access, tools, approvals.

## Steps
1. [Step with commands]
2. [Verification]

## Rollback
[How to undo]

## Escalation
[Who to contact]

## Last tested
[Date and tester]
```

### Environment doc template

```markdown
# [Environment Name]

## Purpose
## URL / endpoints
## Deploy mechanism
## Configuration (variable names only)
## Dependencies
## Differences from production
```

## Recommended files (as project grows)

| File / folder | Description |
|---------------|-------------|
| `Environments.md` | Matrix of all environments |
| `CI_CD.md` | Pipeline architecture and triggers |
| `Monitoring.md` | Dashboards and alert catalog |
| `runbooks/` | Individual operational procedures |
| `Incident_Response.md` | Severity levels, communication, roles |

## Incident documentation

During or after incidents:

1. Use runbooks in this directory as primary response guides.
2. Store post-incident reports in `runbooks/incidents/` or link from [tasks/](../../tasks/).
3. Update runbooks when gaps are discovered — same PR as fix when possible.

## Maintenance

| Field | Value |
|-------|-------|
| **Owner** | _[DevOps / SRE lead]_ |
| **Review cadence** | Quarterly runbook drill; after every pipeline change |
| **Index** | [PROJECT_INDEX.md](../../PROJECT_INDEX.md) |

## Related documents

- [docs/Developer_Handbook/06_Deployment.md](../Developer_Handbook/06_Deployment.md)
- [docs/Architecture/](../Architecture/)
- [docs/Database/](../Database/) — migration execution in production
