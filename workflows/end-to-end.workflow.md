# End-to-End Workflow — REQ → PLAN → TASK → VALIDATION

Complete lifecycle for a small deliverable on the target project. Use with `core/lifecycle.md`.

## Prerequisites

- `#project-setup` completed
- At least one module via `#setup-environment`
- `AGENTS.md`, `.cursor/rules/`, `.github/` active

---

## Step 1 — Requirement (Design)

**Prompt:** `#req-create` or manual edit

1. Add `REQ-XXXX` to `01_Design/areas/{{AREA}}/REQUIREMENTS.md`
2. Mandatory fields: Type, MoSCoW, Priority, acceptance criteria
3. Update `01_Design/_index.md`

**Gate:** REQ approved or explicitly marked in-progress for pilot

---

## Step 2 — Task & Plan

**Prompt:** `#task-create` (design) or `#update-plan` (code)

1. Create `TASK-XXXX` in `01_Design/areas/{{AREA}}/TASKS.md` linked to REQ
2. Update `02_Code/{{AREA}}/{{MODULE}}/PLAN.md` with scope and file list

---

## Step 3 — Implementation (Code)

**Prompts:** `#new-component`, `#generate-docs` as needed

1. Implement in `01_Code/{{AREA}}/{{MODULE}}/src/`
2. Unit tests in `01_Code/.../test/`
3. Doc comments per `DOC_COMMENT_STYLE`

---

## Step 4 — Test Artifacts (Test)

**Prompt:** `#test-case-create`

1. Create `TC-XXXX` in `Test/{{AREA}}/test-cases/`
2. Link REQ acceptance criteria
3. Run tests; record results in TC status

---

## Step 5 — Validation

**Prompt:** `#validation-report`

1. Score against `validators/validation-rubric.yaml`
2. Write JSON to `03_Test/{{AREA}}/reports/`
3. If `VALIDATION_GATE_ENABLED=true` and score < threshold → fix loop

---

## Step 6 — Definition of Done

Verify per `adapters/cursor/rules/90-definition-of-done.mdc`:

- REQ criteria met
- Tests pass
- Public API documented
- Validation report present
- Known bugs filed as BUG-XXXX

---

## Step 7 — Final Report

Human-readable summary in `PROJECT_LANGUAGE`:

- What changed (files)
- REQ/TASK/TC ids
- Validation score
- Residual risks

---

## Related Workflows

- `feature-development.workflow.md` — detailed phase breakdown
- `bug-fix.workflow.md` — when defects found mid-cycle
- `release-check.workflow.md` — pre-release gate
