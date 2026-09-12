# Changelog

## [Unreleased]

### Added

- [ADR Approval Workflow](docs/Architecture/ADRs/ADR_Approval_Workflow.md) — propose, review, and accept ADRs (Proposed → Accepted)
- Phase 6: [Capability Contribution Playbook](docs/AI/Capability_Contribution_Playbook.md) and [edf.capability-contribute.v1.yaml](interaction/specs/edf.capability-contribute.v1.yaml) for semi-automatable AI-guided capability PRs
- Generated `ENGINEERING_DOCUMENTATION_FRAMEWORK.md` now includes **Contributing Capabilities Back to EDF** section (create-if-missing)
- [PROJECT_INDEX.md](PROJECT_INDEX.md) and [README.md](README.md) link multi-discipline bootstrap entry points and contribution workflow
- Multi-discipline bootstrap architecture: [General Engineering Project Model](docs/Architecture/General_Engineering_Project_Model.md), [ADR-0005](docs/Architecture/ADRs/ADR-0005-Project-Classification-and-Capabilities.md), [ADR-0006](docs/Architecture/ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md)
- [CRA, CKES, and EDF Boundaries](docs/Architecture/CRA_CKES_EDF_Boundaries.md)
- Canonical AI bootstrap entry: [EDF AI Bootstrap Entry](docs/AI/EDF_AI_Bootstrap_Entry.md), [Universal Bootstrap Specification](docs/AI/Universal_Bootstrap_Specification.md)
- Composable capabilities registry under `capabilities/` with community `electronics` and `research` pilots from Hardware Research adoption exercise
- [EDF Capability Contribution Guide](docs/Development/EDF_Capability_Contribution_Guide.md), capability PR template, [Cross Repo Concern Matrix Template](docs/Templates/Cross_Repo_Concern_Matrix_Template.md)
- Templates: [Bootstrap Context](docs/Templates/Bootstrap_Context_Template.md), [EDF Bootstrap Report](docs/Templates/EDF_Bootstrap_Report_Template.md)
- [AWI-0005 — Engineering Tool Provider Compatibility](docs/Architecture/Watch_Items/AWI-0005-Engineering-Tool-Provider-Compatibility.md)
- `docs/Architecture/Watch_Items/` added to EDF Core required directories
- Capability-aware profile resolution in `edf_profile.sh` / `edf_profile.ps1`
- Framework Advisor recommendations for `edf-project-context.yaml` and project extensions

### Changed

- Default legacy profile when ambiguous: `core` (was `software-engineering`)
- [edf.bootstrap.v1.yaml](interaction/specs/edf.bootstrap.v1.yaml) v1.1.0 — inspect, context, capability phases; AI entry point binding
- [Bootstrap Playbook](docs/AI/Bootstrap_Playbook.md) — references canonical entry point and inspect-first rules
- [Profile-Aware Bootstrap](docs/Development/Profile_Aware_Bootstrap.md) — capability composition model

### Added

- [EDF ASR Self-Conformance Review](docs/Development/EDF_ASR_Self_Conformance_Review.md) — EDF validated against published ASR bootstrap guidance
- [ASR Self-Conformance Review Procedure](docs/Development/Repository_Bootstrap/Architecture_Specification_Repository/Self_Conformance_Review.md) — self-validation distinct from bootstrap
- `docs/Architecture/Watch_Items/README.md` — watch item domain index
- [AWI-0003 — Repository Semantic Context and Convention Binding](docs/Architecture/Watch_Items/AWI-0003-Repository-Semantic-Context-and-Convention-Binding.md) — open architectural question on repository-level semantics
- [Repository Bootstrap](docs/Development/Repository_Bootstrap/README.md) framework and [Architecture Specification Repository](docs/Development/Repository_Bootstrap/Architecture_Specification_Repository/README.md) bootstrap guidance
- [ASR Bootstrap Playbook](docs/AI/ASR_Bootstrap_Playbook.md) for AI-assisted ASR bootstrap
- ASR templates: Architectural Discovery Record, Architecture Specification, ASR Bootstrap Report
- [ADR-0001 — Domain Profiles](docs/Architecture/ADRs/ADR-0001-Domain-Profiles.md) accepted; navigation and ADR index added
- [ADR-0002 — Domain Profile Specification](docs/Architecture/ADRs/ADR-0002-Domain-Profile-Specification.md) outline (manifest, validation model, software extraction inventory)
- `docs/Architecture/ADRs/README.md` — ADR index for numbered framework ADRs
- Core vs Software Engineering Profile boundary in Documentation Information Architecture

### Changed

- ASR Validation Checklist — checklist applicability matrix and link to Self-Conformance Review Procedure
- Architecture, Specifications, and root README — ASR semantic surfacing (discovery records, dual-semantics Specifications note, reference implementation labeling)
- Glossary — AWI, engineering methodology, and self-conformance review terms
- AWI-0003 — EDF self-conformance status and revisit scheduling notes
- README positioning: general engineering framework; Software Engineering as v1.0 reference profile
- `ARCHITECTURE_DECISIONS.md` and Architecture README index ADR-0001 and ADR-0002

### Deferred (post-v1.0)

- Profile manifest format and `ENGINEERING_DOCUMENTATION_FRAMEWORK.md` profile declaration
- Removing software paths from Core Framework Advisor `required_dirs`
- Profile-aware Framework Advisor, bootstrap `--profile`, and profile packaging
- Music Education profile pilot

### Added

- Bash and PowerShell adoption conformance validation wrappers
  (`run_conformance_validation.sh` / `.ps1`) that run the Framework Advisor
  against an adopting project and save timestamped reports under
  `reports/conformance/` in the target repository
- `docs/Developer_Handbook/00_First_Time_Setup.md` — onboarding entry point linking to authoritative setup sections
- `Development_Environment_Template.md` and `First_Time_Setup_Template.md` templates
- `docs/Developer_Handbook/` added to bootstrap scripts, Framework Advisor required directories, and documentation skeleton generator

### Changed

- Clarified `docs/Developer_Handbook/` (project engineering) vs `docs/Development/` (framework adoption engineering) across architecture and domain README files
- Migration assistant routes setup and handbook content to `docs/Developer_Handbook/`
- Documented GitHub and Obsidian dual-link conventions for section navigation

## M4 – Framework Self-Hosting

### Added

- authoritative Framework Self-Hosting governance document
- active Reference documentation domain
- EDF Self-Hosting Report
- PowerShell and Bash self-hosting validation runners
- timestamped validation report output
- explicit pass criteria and accepted-exception rules
- EDF v1.0 self-hosting release gate

### Changed

- Governance navigation includes Framework Self-Hosting
- Project Index links to self-hosting governance and reports
- self-hosting compliance requires reviewed local Framework Advisor output

## M3 – Framework Advisor

### Added

- broken relative Markdown-link detection
- orphan-document detection
- breadcrumb and parent-navigation validation
- governance metadata and lifecycle validation
- ownership, review-frequency, and overdue-review checks
- separate structure, AI, navigation, governance, and overall scores

### Changed

- project analyzer promoted to the Framework Advisor
- PowerShell and Bash analyzer output expanded with actionable governance findings
- analyzer documentation and governance compliance guidance updated

## M2 – Governance

### Added

- Governance documentation domain
- Governance overview and principles
- Document metadata standard
- Document lifecycle model
- Ownership and review policy
- Documentation change-management policy
- Governance analyzer compliance specification
- Governance review checklist

### Changed

- Project navigation now includes the Governance domain.
- Framework Advisor requirements now include governance validation.
- Governance is formally established as an advisory, non-destructive subsystem.

## M1 – Architecture Freeze

### Added

- Engineering Development Policy
- EDF Development Workflow

### Changed

- Documentation Information Architecture expanded as the canonical architecture.
- Architecture navigation updated.
