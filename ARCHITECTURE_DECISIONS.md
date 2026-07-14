# Architecture Decisions

[Home](README.md) › Architecture Decisions

## Numbered ADRs

Individual ADRs live under [docs/Architecture/ADRs/](docs/Architecture/ADRs/README.md). See the [ADR index](docs/Architecture/ADRs/README.md) for the full list.

| ID | Decision | Status | Date |
|---|---|---|---|
| [ADR-0001](docs/Architecture/ADRs/ADR-0001-Domain-Profiles.md) | Domain Profiles — layered Core + profile architecture | Accepted | 2026-07-15 |
| [ADR-0002](docs/Architecture/ADRs/ADR-0002-Domain-Profile-Specification.md) | Domain Profile specification outline | Proposed | 2026-07-15 |

## Milestone ADRs

### ADR-M1 — Architecture Freeze

**Status:** Accepted

Architecture Freeze completed.

### Decisions

- `Documentation_Information_Architecture.md` is the single authoritative documentation architecture document.
- `Engineering_Development_Policy.md` is the universal engineering policy.
- `EDF_Development_Workflow.md` is specific to development of EDF itself.
- Framework-owned and project-owned artifacts remain distinct.
- Generated project documentation becomes project-owned and must not be overwritten automatically.

## ADR-M2 — Governance Subsystem

**Status:** Accepted

### Decision

EDF shall define a governance subsystem covering document metadata, lifecycle,
ownership, review, change management, and analyzer compliance.

Governance begins as advisory. Automated tools may identify noncompliance and
recommend corrective action, but they must not silently modify project-owned
documentation.

### Consequences

- Governed documents require explicit metadata.
- Canonical documents require ownership and lifecycle state.
- Review obligations become analyzable.
- Governance rules provide the foundation for Framework Advisor scoring.
- Projects may adopt stricter enforcement through configuration or CI.
- Human approval remains the final authority.
## ADR-M3 — Framework Advisor

**Status:** Accepted

### Decision

The project analyzer is promoted to the Framework Advisor.

The Advisor remains read-only and evaluates structure, AI handbook completeness,
hierarchical navigation, relative links, governance metadata, lifecycle validity,
ownership, and review currency.

The Advisor reports transparent category scores and actionable recommendations but
does not modify project-owned documentation.

### Consequences

- PowerShell and Bash implementations must remain behaviorally aligned.
- Analyzer findings are advisory rather than automatic enforcement.
- Governance and navigation standards are now machine-checkable.
- Semantic duplication and factual conflict detection remain future work.
## ADR-M4 — Framework Self-Hosting

**Status:** Accepted

### Decision

EDF shall validate itself using the same Framework Advisor, governance, navigation,
and documentation standards that it defines for adopting projects.

Self-host validation must be repeatable through PowerShell and Bash runners and must
produce a retained report for human review.

EDF must not claim self-hosting compliance solely from an unreviewed numeric score.

### Consequences

- Self-hosting is a release gate for EDF v1.0.
- The active `docs/Reference/` domain stores the self-hosting report.
- Accepted exceptions must be explicit and reviewable.
- The Framework Advisor remains read-only.
- Runner scripts write only validation report output.
- Local validation is required after package merge.
