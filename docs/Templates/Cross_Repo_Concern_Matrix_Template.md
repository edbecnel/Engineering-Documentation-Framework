# Cross-Repository Concern Matrix

[Home](README.md) › Cross-Repository Concern Matrix

> **Status:** Draft
> **Owner:** [Owner]
> **Applies To:** Mapping discipline-specific instances to shared EDF architectural concerns
> **Last Reviewed:** [YYYY-MM-DD]

## Purpose

Map how different engineering projects or disciplines address the **same architectural concerns** using different concrete artifacts and documentation. Adapted from CRA [Knowledge Interaction Evolution Workstream](https://github.com/edbecnel/Canonical-Representation-Architecture/blob/main/docs/Development/Knowledge_Interaction_Evolution_Workstream.md).

Copy from [Cross_Repo_Concern_Matrix_Template.md](../Templates/Cross_Repo_Concern_Matrix_Template.md).

## Concern Matrix

| Architectural concern | Software engineering | Electronics | [Discipline 3] | Notes |
|---|---|---|---|---|
| Requirements | `docs/Specifications/` | `docs/Specifications/` | | |
| Design decisions | `docs/Architecture/ADRs/` | `docs/Architecture/ADRs/` | | |
| Primary design artifacts | Source code (`src/`) | KiCad schematics (artifact) | | Artifacts ≠ docs |
| Test procedures | `docs/Developer_Handbook/` | Governed docs + bench data (artifact) | | |
| Validation evidence | CI logs, test reports | Measurement datasets (artifact) | | |
| Authority / scope | `PROJECT_CHARTER.md` | `edf-project-context.yaml` | | |
| Open questions | Watch Items | Watch Items | | |
| Bootstrap report | `EDF_BOOTSTRAP_REPORT.md` | `EDF_BOOTSTRAP_REPORT.md` | | |

## Shared EDF Core (Invariant)

All rows above sit on:

- EDF Core structure
- [General Engineering Project Model](docs/Architecture/General_Engineering_Project_Model.md)
- [Universal Bootstrap Specification](docs/AI/Universal_Bootstrap_Specification.md)

## Capability Mapping

| Concern row | Relevant capability IDs |
|---|---|
| | |

## Related Documents

- [General Engineering Project Model](docs/Architecture/General_Engineering_Project_Model.md)
- [CRA, CKES, and EDF Boundaries](docs/Architecture/CRA_CKES_EDF_Boundaries.md)
