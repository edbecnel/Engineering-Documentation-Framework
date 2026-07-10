# Update Instructions — AI Handbook Refactor

This update refactors the root `AI_WORKFLOW.md` document into a modular AI Engineering Handbook under `docs/AI/`.

## Important Safety Note

Do not drag the `docs/` folder from Finder onto the existing project root. Finder may replace folders instead of merging them.

Use `ditto` to merge the extracted update folder into the repository root.

Example, when the extracted update folder is inside the repository root:

```bash
ditto "./edf_ai_handbook_update_v3/" "./"
```

Then review the Git diff before committing.

## Files Added or Updated

See `UPDATE_FILE_MANIFEST.md`.

## Files to Delete Manually After Applying the Update

Delete this file from the project root after confirming the new `docs/AI/` files exist:

```text
AI_WORKFLOW.md
```

## Suggested Commit Message

```text
docs: refactor AI workflow into AI handbook
```
