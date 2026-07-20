# Task Sync Adapter (Stub)

Optional integration to synchronize framework artifacts with external issue trackers.

## Scope

Sync **existing** artifacts only — no structural changes to Design/Code/Test:

| Framework artifact | External mapping (example) |
|--------------------|----------------------------|
| `TASK-XXXX` | GitHub Issue / Plane work item |
| `BUG-XXXX` | GitHub Issue (label: bug) |
| `REQ-XXXX` | Epic or custom field link |

## Supported targets (planned)

| Tool | API | Priority |
|------|-----|----------|
| GitHub Issues | REST/GraphQL | v1 candidate |
| Plane | Open API | future |
| Taiga | REST | future |
| GitLab Issues | REST | future |

## Design principles

1. **Read-only SSOT** — `Design/` and `PROJECT_PARAMETERS.md` remain authoritative.
2. **Idempotent sync** — re-run safe; store external id in task metadata or sidecar file.
3. **No secrets in repo** — use `GITHUB_TOKEN` or tool API keys via environment/CI secrets.

## Implementation status

**Stub only.** No sync script shipped in v1.

To implement:

1. Add `adapters/task-sync/github-issues.sync.md` with field mapping spec
2. Add `scripts/sync-tasks.ps1` with `-DryRun` default
3. Document in `docs/automation.md`

## Usage (future)

```powershell
$env:GITHUB_TOKEN = "..."
.\ai-framework\scripts\sync-tasks.ps1 -Provider GitHubIssues -Area backend
```
