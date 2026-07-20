---
mode: agent
description: "Produce validation report JSON scored against the framework rubric."
---

# Validation Report

Generate a validation report for a completed task or change set.

## Input

1. **Task / change scope** — REQ ids, TASK id, or description
2. **Area** — `AREA_NAME`
3. **Module** — optional `MODULE_NAME`
4. **Evidence** — tests run, files reviewed, commands executed

## Process

1. Read `PROJECT_PARAMETERS.md` — note `VALIDATION_THRESHOLD`, `VALIDATION_GATE_ENABLED`.
2. Read `ai-framework/validators/validation-rubric.yaml`.
3. Score each dimension (0–100) with brief justification:
   - requirement_coverage, correctness, maintainability, test_coverage,
     documentation_quality, error_handling, architectural_consistency,
     security_privacy_impact, regression_risk
4. Compute weighted `overall_score` per rubric weights.
5. List `blocking_issues` if any blocking condition applies.
6. Fill `fix_plan` when score below threshold or blockers present.
7. Set `passed` = true only if no blockers AND (
   `VALIDATION_GATE_ENABLED=false` OR `overall_score >= threshold`).

## Output

Write JSON to: `Test/{{AREA_NAME}}/reports/validation-<task-or-date>.json`

Use `ai-framework/templates/validation-report.template.json` structure.

## Report (human summary)

In `PROJECT_LANGUAGE`, provide:

- Overall score and pass/fail
- Top 3 strengths and gaps
- Next actions if gate enabled and failed
