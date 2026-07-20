---
mode: agent
description: "Create a structured bug report BUG-XXXX with traceability."
---

# Bug Create

Create a new bug report (`BUG-XXXX`) in `Test/{{AREA_NAME}}/bugs/`.

## Input

Collect:

1. **Area** — `AREA_NAME`
2. **Title** — concise summary
3. **Severity** — critical | high | medium | low
4. **Priority** — aligns with project convention
5. **Description** — what is wrong
6. **Steps to reproduce** — numbered, reproducible
7. **Expected vs actual**
8. **Environment** — OS, runtime, version/build
9. **Linked REQ / TC** — if known
10. **Impacted files** — paths in `Code/`

## Process

1. Read `PROJECT_PARAMETERS.md`.
2. Allocate next BUG id (scan `Test/**/bugs/`).
3. Use `ai-framework/templates/bug.template.yaml` as schema.
4. Write: `Test/{{AREA_NAME}}/bugs/BUG-XXXX-<slug>.yaml`
5. If regression, set `regression: yes` and link failing TC if exists.

## Output Quality

- Reproduction steps are minimal and deterministic.
- `test_case_required: true` unless user confirms otherwise.
- All text in `PROJECT_LANGUAGE`.

## Report

File path, severity, linked artifacts, suggested owner/module.
