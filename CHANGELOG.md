# Changelog

## [Unreleased]

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
