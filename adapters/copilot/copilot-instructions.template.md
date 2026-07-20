<!--
  TEMPLATE NOTE — remove this comment block during instantiation.
  This file becomes `.github/copilot-instructions.md` after every {{TOKEN}} is resolved.
-->

# {{PROJECT_NAME}} — GitHub Copilot Workspace Instructions

**Client:** {{CLIENT_NAME}}
**Project language:** {{PROJECT_LANGUAGE}} — all artifacts in this language only (never mixed).
**Scope:** All files in this workspace.

---

## Project Overview

{{PROJECT_DESCRIPTION}}

Methodology: **{{WORKFLOW_TYPE}}**

| Layer | Path | Purpose |
|-------|------|---------|
| Design | `Design/areas/{{AREA_NAME}}/` | REQ, TASKS, decisions, architecture |
| Code | `Code/{{AREA_NAME}}/{{MODULE_NAME}}/` | Implementation, PLAN.md, unit tests |
| Test | `Test/{{AREA_NAME}}/` | TC, bugs, reports, traceability |

> Keep this table aligned with `PROJECT_PARAMETERS.md`.

---

## Single Source of Truth

1. **`PROJECT_PARAMETERS.md`** — resolved parameters (zero unresolved `{{...}}`).
2. **`Design/areas/*/REQUIREMENTS.md`** — approved REQ (`REQ-XXXX`).
3. **`Design/_index.md`** — master REQ index.
4. **`ai-framework/`** — methodology, workflows, standards, templates.

Do not invent rules not present in documentation. If information is missing, state it explicitly.

---

## Key Reference Files

| Topic | File |
|-------|------|
| Coding style | `.github/instructions/coding-style.instructions.md` |
| Style spec | `.github/specs/coding-style.yml` |
| Module structure | `.github/specs/module-structure.yml` |
| PLAN schema | `.github/specs/plan-schema.yml` |
| Review schema | `.github/specs/review-plan-schema.yml` |
| Planning | `.github/instructions/planning.instructions.md` |
| Documentation | `.github/instructions/documentation.instructions.md` |
| Markdown style | `.github/instructions/markdown-style.instructions.md` |
| Code review | `.github/instructions/code-review.instructions.md` |
| Environment setup | `.github/instructions/environment-setup.instructions.md` |

<!-- If {{HAS_GUI_MODULE}} == true, also add GUI rows from optional gui-theming module. -->

---

## Permanent Rules (every response)

1. **Language standard:** {{LANGUAGE_STANDARD}} — no unsupported features.
2. **External dependencies:** {{ALLOW_EXTERNAL_DEPENDENCIES}} (`false` = stdlib/runtime only).
3. **Naming:** Follow `.github/instructions/coding-style.instructions.md` and `.github/specs/coding-style.yml`.
4. **Formatting:** {{INDENT_STYLE}} (width {{INDENT_WIDTH}}), braces {{BRACE_STYLE}}, {{LINE_LENGTH_LIMIT}} columns.
5. **Doc comments:** {{DOC_COMMENT_STYLE}} per `.github/instructions/documentation.instructions.md`.
6. **Cross-module:** {{CROSS_MODULE_POLICY}}.
7. **REQ metadata:** Every REQ must have Type, MoSCoW, Priority.
8. **Validation gate:** When `VALIDATION_GATE_ENABLED=true`, score must be ≥ {{VALIDATION_THRESHOLD}}.

---

## Design Workflows

| Prompt | Purpose |
|--------|---------|
| `#project-setup` | Initial project structure (Design/Code/Test) |
| `#meeting-digest` | Structure meeting notes |
| `#req-create` | Extract REQ from raw notes |
| `#req-review` | Verify REQ vs implementation |

Raw input → `_RAW/`; structured minutes → `Design/meetings/`.

---

## Code Workflows

| Prompt | Purpose |
|--------|---------|
| `#setup-environment` | Module setup + IDE adapters |
| `#new-module` | Generate PLAN.md |
| `#new-component` | Scaffold class/component |
| `#review-code` | Structured review → REVIEW.md |
| `#update-plan` | Update PLAN.md / TASKS.md |
| `#generate-docs` | Generate doc comments |

Apply `.github/instructions/planning.instructions.md` when planning.
Reviews never modify source — produce `REVIEW.md` first.

---

## Test Workflows

| Prompt | Purpose |
|--------|---------|
| `#test-case-create` | Create TC-XXXX |
| `#bug-create` | Create BUG-XXXX |
| `#validation-report` | Quality score JSON |

Artifacts live under `Test/{{AREA_NAME}}/`.

---

## Expected Output

For technical answers using internal docs, end with:

```markdown
## Sources used
- path/file.md (section)
- REQ-XXXX (if applicable)
```
