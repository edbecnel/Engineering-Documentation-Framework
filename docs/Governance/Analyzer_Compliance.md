# Governance Analyzer Compliance

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Governance](README.md) › Governance Analyzer Compliance

> **Status:** Canonical
> **Owner:** Engineering Documentation Framework
> **Applies To:** Framework Advisor and compatible analyzers
> **Last Reviewed:** 2026-07-10

## Applicability

This document defines baseline governance that applies to:

- the Engineering Documentation Framework repository
- projects that adopt the Engineering Documentation Framework

EDF itself follows this baseline governance and also follows the additional
framework-specific requirements in [EDF Governance](EDF_Governance.md).

## Purpose

This specification defines baseline governance checks that the Framework Advisor or a compatible analyzer should support for both EDF and adopting projects.

Checks that apply only to maintenance of EDF itself are defined in [EDF Governance](EDF_Governance.md).

## Initial Checks

The analyzer should detect:

- missing required metadata
- invalid lifecycle states
- missing owners
- missing review frequency
- missing last-reviewed date
- overdue reviews
- multiple authoritative documents for the same declared concept
- authoritative documents in Draft or Archived status
- deprecated documents without replacement information
- archived documents present in active navigation
- missing parent links
- missing related-document links where required
- governance documents missing from project navigation

## Severity Model

### Informational

A useful observation that does not indicate noncompliance.

### Recommendation

A governance improvement should be considered.

### Warning

A governance requirement is not satisfied or may create ambiguity.

### Critical

A condition creates significant risk, such as conflicting authoritative sources or
missing governance for security-critical documentation.

## Advisory Behavior

The analyzer must explain:

- what was found
- why it matters
- which rule applies
- the recommended corrective action

The analyzer must not change project-owned content automatically.

## Scoring

A future governance score may consider:

- metadata completeness
- ownership coverage
- review currency
- lifecycle validity
- canonical-source consistency
- navigation compliance

Scoring formulas should be transparent and configurable.

## Configuration

Checks should eventually be controlled through EDF configuration so projects can:

- enable or disable checks
- adjust severity
- define required document classes
- define review intervals
- define exceptions

## Exceptions

Accepted exceptions should be explicit, documented, scoped, and reviewable.

The analyzer should distinguish accepted exceptions from unreviewed noncompliance.

## Parent

- [Governance](README.md)

## Related Documents

- [Governance Overview](Governance_Overview.md)
- [EDF Governance](EDF_Governance.md)
- [Document Metadata Standard](Document_Metadata_Standard.md)
- [Ownership and Review](Ownership_and_Review.md)
- [Governance Checklist](Governance_Checklist.md)
