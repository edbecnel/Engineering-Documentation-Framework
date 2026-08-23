# Hardware Research Adoption Exercise

## Purpose

Record the first real-project adoption exercise that extracted the **electronics** discipline capability (community tier). This follows CRA Option D: govern one artifact, capture gaps, extract reusable capability — not an atomic `electronics-research` profile.

## Source Project

Hardware Research engineering project (PCB/sensor research prototypes).

## Project Context (Illustrative)

```yaml
repository_role: engineering-project
disciplines:
  - electronics
activities:
  - research
  - validation
capabilities:
  - electronics
  - research
```

## Exercise Steps Completed

| Step | Outcome |
|---|---|
| Inspect repository | Mapped KiCad schematics/PCBs as engineering artifacts at existing paths |
| Preserve artifacts | No relocation of `.kicad_sch` / `.kicad_pcb` into `docs/` |
| Bootstrap EDF Core | `adopt-edf.sh bootstrap --profile core` |
| Govern first chain | Requirement → design decision → schematic traceability documented |
| Extract capability | `electronics` discipline capability with `artifact_classes` |
| Record gaps | Manufacturing, compliance deferred |

## Key Architectural Decisions

1. **Schematics are artifacts** — governed via metadata and documentation links, not `docs/Schematics/` paths ([ADR-0006](../../../docs/Architecture/ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md)).
2. **Research is an activity** — composes with electronics discipline; not a combined profile ID.
3. **BOM governance** — structured BOM files may live outside `docs/`; policy and alternates in Specifications.

## Capability Gaps → Future Work

| Gap | Classification | Action |
|---|---|---|
| `research` activity capability | candidate-capability | Extract from same exercise in follow-on PR |
| FPGA bitstream artifact class | project-customization | Document per-project until second adopter |
| Fabrication package lifecycle | capability-requirement | Add to electronics v0.2 after validation |

## Validation Plan

| Field | Value |
|---|---|
| **validation_scope** | discipline |
| **Target** | Second electronics project (not necessarily different discipline) |
| **Promotion** | `contrib/electronics` → `capabilities/electronics` after validation |

## Related Documents

- [electronics/capability.yaml](capability.yaml)
- [EDF Capability Contribution Guide](../../../docs/Development/EDF_Capability_Contribution_Guide.md)
- [Universal Bootstrap Specification](../../../docs/AI/Universal_Bootstrap_Specification.md)
