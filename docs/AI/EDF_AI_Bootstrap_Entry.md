# EDF AI Bootstrap Entry

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [AI Engineering Handbook](README.md) › EDF AI Bootstrap Entry

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** AI systems applying EDF to any engineering project
> **Last Reviewed:** 2026-08-23
> **Review Frequency:** On Change
> **Authoritative:** Yes

## If You Are an AI System Applying EDF — Begin Here

This document is the **canonical entry point** for AI-assisted EDF bootstrap (EDF-GEP-002).

Do not guess among `README.md`, individual playbooks, ADRs, or interaction specs. Follow the discovery chain below in order.

## Bootstrap Discovery Chain

| Step | Document | Purpose |
|---|---|---|
| 1 | **This document** | Entry point and navigation |
| 2 | [Universal Bootstrap Specification](Universal_Bootstrap_Specification.md) | Normative bootstrap contract |
| 3 | [General Engineering Project Model](../Architecture/General_Engineering_Project_Model.md) | Discipline-independent concepts |
| 4 | [ADR-0005 — Project Classification and Capabilities](../Architecture/ADRs/ADR-0005-Project-Classification-and-Capabilities.md) | How to characterize the project |
| 5 | [Bootstrap Guide](../Development/Bootstrap_Guide.md) | Human-oriented bootstrap checklist |
| 6 | [Bootstrap Playbook](Bootstrap_Playbook.md) | AI decision trees, prompts, validation gates |
| 7 | [edf.bootstrap.v1.yaml](../../interaction/specs/edf.bootstrap.v1.yaml) | Machine-readable phase contract (optional binding) |

### Repository role overlays

If the human confirms an **Architecture Specification Repository**, also read:

- [ASR Bootstrap Procedure](../Development/Repository_Bootstrap/Architecture_Specification_Repository/Bootstrap_Procedure.md)
- [ASR Bootstrap Playbook](ASR_Bootstrap_Playbook.md)

ASR classification is **human-confirmed only** — never auto-detect.

## Bootstrap Flow Summary

```text
1. Read Universal Bootstrap Specification
2. Inspect existing project — map documentation AND engineering artifacts; preserve historical content
3. Establish project engineering context (repository role, disciplines, activities, authority)
4. Resolve applicable EDF capabilities from capabilities/index.yaml (if any match)
5. Propose composition + extensions to human — WAIT for confirmation
6. Run adopt-edf.sh bootstrap (Core minimum; capability hints create-if-missing)
7. Customize identity documents (CHARTER, INDEX, README)
8. Write EDF_BOOTSTRAP_REPORT.md
9. Run adopt-edf.sh validate
```

**Success criterion:** You reach human confirmation and bootstrap using EDF Core alone even when the project's engineering discipline is unknown to EDF.

## Required Inputs from Human

Collect before structural changes:

| Input | Required |
|---|---|
| Target project path | Yes |
| Local EDF clone path | Yes (for adopt-into-separate-repo pattern) |
| Project name | Yes |
| Repository role confirmation | Yes |
| Discipline and activity description (if not detectable) | When ambiguous |
| Optional `BOOTSTRAP_CONTEXT.md` at project root | No |

## Key Artifacts Produced

| Artifact | When |
|---|---|
| `edf-project-context.yaml` | After context resolution, before bootstrap |
| `edf-adoption.yaml` | During bootstrap (legacy `profile:` supported) |
| `EDF_BOOTSTRAP_REPORT.md` | After bootstrap |
| ADR for project extensions | When capabilities do not cover project needs |

## What Not To Do

- Do not relocate or overwrite existing files without explicit human approval
- Do not move engineering artifacts into `docs/` by default ([ADR-0006](../Architecture/ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md))
- Do not require CKES or CRA implementations ([CRA, CKES, and EDF Boundaries](../Architecture/CRA_CKES_EDF_Boundaries.md))
- Do not treat unknown disciplines as errors or degraded mode

## Parent

- [AI Engineering Handbook](README.md)

## Related Documents

- [Universal Bootstrap Specification](Universal_Bootstrap_Specification.md)
- [Bootstrap Playbook](Bootstrap_Playbook.md)
- [Bootstrap Context Template](../Templates/Bootstrap_Context_Template.md)
- [EDF Bootstrap Report Template](../Templates/EDF_Bootstrap_Report_Template.md)
