# Project Analysis and Validation Tool

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Development](README.md) › Project Analysis and Validation Tool

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** EDF and adopting projects
> **Last Reviewed:** 2026-07-10
> **Review Frequency:** Per Release
> **Authoritative:** Yes

## Purpose

The Framework Advisor is a read-only analysis tool that evaluates how closely a repository follows the Engineering Documentation Framework.

It reports structural, navigation, and governance findings without changing project files.

## Safety Guarantee

The Framework Advisor never:

- creates files or directories
- overwrites or edits files
- deletes files
- renames or moves files
- assigns owners or approvals
- resolves governance exceptions automatically

## Scripts

PowerShell:

```powershell
.\scripts\analyze_project_structure.ps1 -ProjectRoot "D:\Projects\Existing Project"
```

Bash:

```bash
./scripts/analyze_project_structure.sh "/Users/ed/Projects/Existing Project"
```

## M3 Analysis Areas

### Structure

- required canonical directories
- recommended root documents
- Markdown outside canonical locations
- retired `AI_WORKFLOW.md`
- legacy `documents/` folder awareness

### AI Handbook

- modular handbook completeness
- missing required AI documents

### Navigation

- broken relative Markdown links
- orphan Markdown documents
- missing breadcrumb navigation
- missing parent domain README links

### Governance

- Governance-domain completeness
- valid lifecycle states
- required owner and scope metadata
- required review metadata
- overdue reviews
- invalid authoritative status combinations
- deprecated documents without replacement information

## Scores

The Advisor reports:

- overall compliance
- structure score
- AI score
- navigation score
- governance score

Scores are guidance, not certification. Findings and recommendations remain more important than the numeric result.

## Advisory Output

Each finding identifies the affected document and the condition detected.

The tool recommends corrective action but does not apply changes automatically.

## Known Limits

The Advisor does not yet:

- detect semantic duplicate content
- determine whether two documents conflict factually
- validate external URLs
- validate Markdown heading anchors
- infer project-specific exceptions
- replace human review

## Parent

- [Development](README.md)

## Related Documents

- [Documentation Migration Assistant](Documentation_Migration_Assistant.md)
- [Documentation Generation Engine](Documentation_Generation_Engine.md)
- [Governance Analyzer Compliance](../Governance/Analyzer_Compliance.md)
- [Governance Checklist](../Governance/Governance_Checklist.md)
- [Document Metadata Standard](../Governance/Document_Metadata_Standard.md)
- [Documentation Information Architecture](../Architecture/Documentation_Information_Architecture.md)
