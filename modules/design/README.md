# Design Module

Templates for **Design** pillar: requirements, meetings, review and project setup.

> Migrated from `Orig_Data/01.Design`. Active on target project after `#project-setup`.

---

## Purpose

Manage requirements as Markdown (`REQ-XXXX` global IDs) with multidimensional classification.
Flow: raw notes → structured meetings → requirements → review.

## Quickstart (target project)

1. Run `#project-setup` — creates `Design/`, areas, `_index.md`, `_RAW/`.
2. Drop raw material in `_RAW/`.
3. Run `#meeting-digest` → `Design/meetings/`.
4. Run `#req-create` → `Design/areas/{{AREA}}/REQUIREMENTS.md`.
5. Run `#req-review` before closing a sprint or milestone.

## Folder Map

| Path | Content |
|------|---------|
| [`copilot-instructions.template.md`](copilot-instructions.template.md) | Workspace policy for Design phase |
| `prompts/project-setup.prompt.md` | Initial project interview + structure |
| `prompts/meeting-digest.prompt.md` | Structure raw meeting notes |
| `prompts/req-create.prompt.md` | Extract REQ from raw material |
| `prompts/req-review.prompt.md` | Verify REQ vs implementation |
| `templates/req-area-file.template.md` | Template for area REQUIREMENTS.md |
| `examples/` | Reference `_index.md`, AREA example, meeting templates |

## Mandatory REQ fields (D19)

Every requirement must include:

- **Type** — functional | safety | security | performance
- **MoSCoW** — Must | Should | Could | Won't
- **Priority** — Alta | Media | Bassa

## Prompt catalog

| Prompt | When |
|--------|------|
| `#project-setup` | Once per target project |
| `#meeting-digest` | After raw meeting/transcript |
| `#req-create` | When extracting requirements |
| `#req-review` | Sprint end / before release |

## Target project mapping

| Meta-framework | Target project |
|----------------|----------------|
| `prompts/project-setup` | Creates `Design/_index.md`, `Design/areas/` |
| `examples/REQUIREMENTS/_index.md` | Becomes `Design/_index.md` pattern |
| `examples/REQUIREMENTS/AREA_example.md` | Pattern for `REQUIREMENTS.md` |
