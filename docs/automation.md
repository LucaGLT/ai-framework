# Automation

Scripts and integrations for artifact validation and external sync (Phase 5).

## Validation script

`scripts/validate-artifacts.ps1` — lightweight checks on a target project:

- `PROJECT_PARAMETERS.md` has no unresolved `{{TOKEN}}`
- YAML files under `Test/` parse correctly
- Validation report JSON matches template shape
- Optional: markdownlint if installed globally

Run from **target project root**:

```powershell
.\ai-framework\scripts\validate-artifacts.ps1
```

Or from meta-framework development:

```powershell
.\scripts\validate-artifacts.ps1 -ProjectRoot C:\path\to\pilot-repo
```

## Future automation

- JSON Schema validation for bug/TC YAML (extend `validators/`)
- CI job template for GitHub Actions
- Populate `.cursor/mcp.json` with concrete MCP servers when needed

## Task sync

See `adapters/task-sync/README.md` for optional GitHub Issues / Plane / Taiga adapters.

The sync layer does **not** change Design/Code/Test structure — it mirrors existing TASK/REQ artifacts.
