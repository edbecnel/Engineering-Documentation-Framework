# AWI-0005-Engineering-Tool-Provider-Compatibility

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › AWI-0005 Engineering Tool Provider Compatibility

| | |
|---|---|
| **Status** | Active |
| **Owner** | Engineering Documentation Framework |
| **Created** | 2026-08-23 |
| **Revisit Trigger** | After first multi-discipline capability adoption exercise completes |
| **Related ADRs** | [ADR-0006](../ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md), [General Engineering Project Model](../General_Engineering_Project_Model.md) |

---

# Engineering Tool Provider Compatibility

## Objective

Define how EDF-enabled projects govern inputs, outputs, provenance, and interpretation for external **Engineering Tool / Engineering Engine Providers** (PCB routers, circuit simulators, thermal analyzers, FPGA synthesizers, etc.) without coupling EDF to any specific tool.

## Context

[General Engineering Project Model](../General_Engineering_Project_Model.md) states that EDF documents tool inputs, identity, configuration, generated artifacts, results, provenance, interpretation, and derived decisions. The storage and validation mechanism is not yet specified.

This watch item captures **Q9** from the multi-discipline bootstrap review.

## Scope and Non-Goals

This watch item:

- Does **not** require EDF to implement or invoke engineering tools.
- Does **not** mandate a universal artifact ontology.
- Does **not** couple EDF to KAI or any particular vendor.

## Signals to Watch

- Adopters using KiCad, SPICE, CAD, or simulation tools alongside EDF documentation.
- Demand for artifact traceability from requirement through tool output to validation report.
- Capability manifests declaring `artifact_classes` with tool metadata.

## Promotion Criteria

1. At least one adoption exercise documents tool artifact governance end-to-end.
2. Capability contribution includes artifact class definitions with provenance fields.
3. Framework maintainer approves elevation to ADR or normative capability schema extension.

## Parent

- [Watch Items](README.md)
