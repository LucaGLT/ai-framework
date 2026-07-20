# Bug Fix Workflow

## Phase 1 — Bug intake

- Create BUG-XXXX in `Test/{{AREA}}/bugs/` from `templates/bug.template.yaml`
- Record steps, expected vs actual, environment

## Phase 2 — Reproduction

- Reproduce if possible; document if not
- Add failing test before fix when feasible

## Phase 3 — Root cause

- Smallest likely cause; check regression risk

## Phase 4 — Fix

- Minimal safe fix in `Code/`
- Preserve unrelated behaviour

## Phase 5 — Validation

- Re-run tests; update bug status
- Validation report if gate enabled

## Phase 6 — Final report

Cause, fix, tests, regression risk, validation score.
