# MVR-NNNN: [Short title]

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Verification](../Verification/README.md) › [Records](../Verification/Records/README.md) › MVR-NNNN

## Identity

| Field | Value |
|---|---|
| **Record ID** | MVR-NNNN |
| **Manual QA** | Required |
| **Human execution status** | Pending / In progress / Complete |
| **Owner** | [Role or name] |
| **Verification date** | YYYY-MM-DD (or period) |

**Human execution status:** Set **Complete** only when all **required** MVTs were executed by an authorized human with outcomes that satisfy the verification obligation (typically **Pass** in the execution record). Do not set **Complete** because a governing record waived the obligation while MVTs remain non-Pass.

## Verification basis / obligation

| Requirement | Link | Notes |
|---|---|---|
| [Title] | [relative/path.md](relative/path.md) | Acceptance condition |

State **what** must be verified and **why** (acceptance criteria, gate condition, or tranche requirement).

## Implementation scope

| Anchor | Value |
|---|---|
| Repository paths | |
| Branch / commit / tag | |
| Environment or build | |
| Out of scope (explicit) | |

## Operator environment and test data (optional)

_Complete when disposable filesystem subjects, fixtures, or environment reset are relevant to this MVR. **Omit this section** when verification does not require them. Placement, isolation, and cleanup semantics are defined in [DVW-0001](../Specifications/DVW-0001-Disposable-Verification-Workspaces.md); this section records execution metadata only._

| Field | Value |
|---|---|
| Disposable filesystem subjects required? | Yes / No |
| Resolved DVW path(s) used | _(concrete paths at execution time — not canonical engineering artifacts)_ |
| Test data / fixture identification | _(committed fixture refs, seeds, or other inputs where applicable)_ |
| Safety or reset prerequisites | _(scope limits, backup, isolation checks, or other safeguards)_ |
| Cleanup expectation | _(for example operator SHOULD dispose DVW content after the session per DVW-0001)_ |

## Manual verification — human execution required

_Executable operator checklist. Do not bury tests in narrative prose._

- [ ] **MVT-1** — [Short test name]

  **Preparation / support (optional; may be automated):**  
  _Omit when not needed. Deterministic setup (for example DVW creation, disposable directories, sentinel files, paths recorded for the human step)._

  **Human procedure:**  
  [What the authorized human does — concise steps]

  **Expected result:**  
  [Explicit pass condition]

- [ ] **MVT-2** — [Short test name]

  **Human procedure:**  
  [Steps — use a separate preparation block only when useful]

  **Expected result:**  
  [Pass condition]

_Add one block per required MVT. Checkbox is a usability aid; the execution record below is authoritative. When automation performed preparation, record provenance in **Evidence** (for example executor or notes) so it is not confused with human attestation._

## Execution record

| MVT ID | Result | Executor | Date | Evidence |
|---|---|---|---|---|
| MVT-1 | Pending / Pass / Fail / Blocked | | | [links] |
| MVT-2 | Pending / Pass / Fail / Blocked | | | |

**MVT Result** MUST be **Pending**, **Pass**, **Fail**, or **Blocked** only. **Waived** is not an MVT result. Keep checkbox state consistent with **Result**; on conflict, **Result** governs.

## Evidence references

_Link engineering artifacts outside `docs/` (screenshots, recordings, exports) per project policy. Do not paste large binaries into this file._

| MVT ID | Artifact or reference |
|---|---|
| MVT-1 | |

## Governing work / acceptance relationship

| Governing item | Link | Role |
|---|---|---|
| [EGR / tranche / GMR / AAR / PA acceptance] | [relative/path.md](relative/path.md) | Acceptance depends on this MVR |

## Notes (optional)

_Informational only. May reference a governing waiver (for example EGR gate waiver) for traceability. Notes do not change MVT Result or Human execution status._

---

## Parent

- [Verification Records](../Verification/Records/README.md)

## Related Documents

- [MVR-0001](../Specifications/MVR-0001-Manual-Verification-Records.md)
- [DVW-0001](../Specifications/DVW-0001-Disposable-Verification-Workspaces.md) — disposable filesystem subjects (optional metadata in this template)
- [ADR-0010](../Architecture/ADRs/ADR-0010-Manual-Verification-Records.md)
