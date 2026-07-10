# Architecture Decisions

## ADR-M1 — Architecture Freeze

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
## ADR-M2A — Governance Applicability Layers

**Status:** Accepted

### Decision

EDF Governance is divided into two applicability layers:

1. Baseline governance applies to both EDF and projects adopting EDF.
2. `EDF_Governance.md` defines additional requirements that apply only to
   development, maintenance, self-hosting, and release of EDF itself.

Each baseline Governance document must identify its applicability explicitly.

### Consequences

- Adopting projects are not required to maintain EDF-specific framework machinery.
- EDF remains subject to the same baseline governance it defines for adopting projects.
- Framework-specific rules have one authoritative document.
- Analyzer rules can distinguish universal project compliance from EDF self-hosting compliance.
