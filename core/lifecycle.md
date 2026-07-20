# Lifecycle

## End-to-end flow

```text
_RAW/ (unstructured input)
    ↓  #meeting-digest
01_Design/meetings/
    ↓  #req-create
01_Design/areas/{{AREA}}/REQUIREMENTS.md  (REQ-XXXX, global IDs)
    ↓  #project-setup / #setup-environment
02_Code/{{AREA}}/{{MODULE}}/PLAN.md + TASKS
    ↓  #new-component / implementation
02_Code/{{AREA}}/{{MODULE}}/src/
    ↓  #review-code
REVIEW.md
    ↓  #test-case-create / tests
03_Test/{{AREA}}/test-cases/TC-XXXX
    ↓  #bug-create (if needed)
03_Test/{{AREA}}/bugs/BUG-XXXX
    ↓  #validation-report
03_Test/{{AREA}}/reports/validation-report.json
    ↓  score ≥ {{VALIDATION_THRESHOLD}} (mandatory from meta-framework Phase 2)
Definition of Done
```

## Phase detail

### 1 — Intake

- Read `AGENTS.md`, `PROJECT_PARAMETERS.md`, relevant module README.
- Convert user request into structured REQ if not already present.
- Mandatory REQ fields: **Type**, **MoSCoW**, **Priority** (see guide §2, D19).

### 2 — Planning

- Break work into TASK linked to REQ.
- Update `PLAN.md` or `TASKS.md`.
- Identify impacted files, tests, risks.

### 3 — Architecture (when non-trivial)

- Check consistency with existing design docs.
- Create DEC-XXXX in `Design/areas/{{AREA}}/decisions/` if needed.

### 4 — Implementation

- Incremental changes in `Code/{{AREA}}/{{MODULE}}/src/`.
- Follow per-module coding specs and instructions.
- Update documentation per `{{DOC_COMMENT_STYLE}}`.

### 5 — Testing

- Unit tests in module `test/` folder.
- Integration / system tests in `Test/{{AREA}}/`.
- Record commands and results as evidence.

### 6 — Validation

- Produce validation report from `templates/validation-report.template.json`.
- Score using `validators/validation-rubric.yaml`.
- Default threshold: 85 (configurable via `{{VALIDATION_THRESHOLD}}`).

### 7 — Fix loop

If validation fails or tests fail:

1. Identify blocking issues.
2. Produce fix plan.
3. Apply fixes.
4. Re-run tests.
5. Regenerate validation report.

### 8 — Completion

- Final report: what changed, REQ covered, tests run, score, known limits.
- Do not mark complete with open blocking issues.

## Workflow files

| Scenario | Workflow |
|----------|----------|
| New feature | `workflows/feature-development.workflow.md` (Phase 1) |
| Bug fix | `workflows/bug-fix.workflow.md` (Phase 1) |
| Refactor | `workflows/refactor.workflow.md` (Phase 1) |
| Release | `workflows/release-check.workflow.md` (Phase 1) |
| Documentation | `workflows/documentation.workflow.md` (Phase 1) |
