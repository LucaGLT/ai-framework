# Feature Development Workflow

## Phase 1 — Requirement intake

- Convert user request into REQ in `Design/areas/{{AREA}}/REQUIREMENTS.md`
- Use global ID (`REQ-0001`, …); update `Design/_index.md`
- Mandatory: Type, MoSCoW, Priority
- Document assumptions

## Phase 2 — Planning

- Create TASK linked to REQ
- Update `PLAN.md` or `TASKS.md`
- Identify impacted files and tests

## Phase 3 — Architecture review

- Check consistency with `01_Design/areas/{{AREA}}/architecture/`
- Create DEC-XXXX if needed

## Phase 4 — Implementation

- Incremental changes in `02_Code/{{AREA}}/{{MODULE}}/src/`
- Update documentation

## Phase 5 — Testing

- Unit tests in module `test/`
- TC-XXXX in `03_Test/{{AREA}}/test-cases/` when needed

## Phase 6 — Validation

- Validation report JSON + rubric score
- Respect `VALIDATION_GATE_ENABLED`

## Phase 7 — Fix loop

If gate enabled and score below threshold: fix → re-test → new report.

## Phase 8 — Final report

Summary, REQ covered, tests, score, known limits — in `{{PROJECT_LANGUAGE}}`.
