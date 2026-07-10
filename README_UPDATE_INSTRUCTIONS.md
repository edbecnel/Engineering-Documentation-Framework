# Framework Consistency Update

This package aligns the bootstrap, analysis, migration, and information-architecture components with the modular AI Engineering Handbook under `docs/AI/`.

## Apply the Update

1. Extract this ZIP into a temporary folder.
2. From the project root, merge the extracted package using `ditto`:

   ```bash
   ditto "./edf_framework_consistency_update/" "./"
   ```

3. Review the Git changes before committing.
4. No project files need to be deleted for this update.

## Files to Copy or Overwrite

- `scripts/analyze_project_structure.sh`
- `scripts/analyze_project_structure.ps1`
- `scripts/plan_documentation_migration.sh`
- `scripts/plan_documentation_migration.ps1`
- `scripts/create_canonical_structure.sh`
- `scripts/create_canonical_structure.ps1`
- `docs/Development/Project_Analysis_Validation_Tool.md`
- `docs/Development/Documentation_Migration_Assistant.md`
- `docs/Architecture/Documentation_Information_Architecture.md`

## Files to Delete

None.

## Suggested Commit Message

`chore: align framework tools with modular AI handbook`
