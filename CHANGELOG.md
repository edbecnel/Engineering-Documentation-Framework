# Changelog

All notable changes to the **Engineering Documentation Framework** are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- _Nothing yet — add entries here as the framework evolves._

---

## [1.0.0] - 2026-07-07

### Added

- Initial release of the Engineering Documentation Framework.
- Root documentation: `README.md`, `PROJECT_INDEX.md`, `PROJECT_CHARTER.md`, `ARCHITECTURE_DECISIONS.md`, `AI_WORKFLOW.md`.
- Developer Handbook with six foundational guides:
  - Development Environment
  - AI Development
  - Git Workflow
  - Coding Standards
  - Testing
  - Deployment
- Documentation area structure under `docs/`:
  - Architecture
  - API
  - Database
  - Deployment
  - Specifications
  - User Guides
- `tasks/` directory for active work tracking.
- `archive/` directory for retired documents.
- MIT License.

---

## Versioning policy

| Version part | When to increment |
|--------------|-------------------|
| **MAJOR** | Breaking changes to folder structure, required files, or conventions that adopters must migrate |
| **MINOR** | New templates, handbook sections, or optional directories |
| **PATCH** | Clarifications, typo fixes, non-structural improvements |

Projects that **adopt** this framework should maintain their own `CHANGELOG.md` for application releases. This file tracks changes to the **framework template** only.

## How to update this changelog

When contributing framework improvements:

1. Add entries under `[Unreleased]` using categories: `Added`, `Changed`, `Deprecated`, `Removed`, `Fixed`, `Security`.
2. On release, rename `[Unreleased]` to `[X.Y.Z] - YYYY-MM-DD` and create a fresh `[Unreleased]` section.
3. Link the release in the repository's GitHub Releases page when applicable.

[Unreleased]: https://github.com/your-org/Engineering-Documentation-Framework/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/your-org/Engineering-Documentation-Framework/releases/tag/v1.0.0
