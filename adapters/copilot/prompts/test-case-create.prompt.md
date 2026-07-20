---
mode: agent
description: "Create a structured test case TC-XXXX linked to requirements."
---

# Test Case Create

Create a new test case (`TC-XXXX`) in `Test/{{AREA_NAME}}/test-cases/`.

## Input

Collect or infer:

1. **Area** — `AREA_NAME`
2. **Module** — optional `MODULE_NAME`
3. **Linked REQ** — at least one `REQ-XXXX` from `Design/areas/{{AREA}}/REQUIREMENTS.md`
4. **Title** — short descriptive name
5. **Type** — manual | automated | partial
6. **Steps** — action + expected result per step
7. **Preconditions** — environment/setup

## Process

1. Read `PROJECT_PARAMETERS.md` and confirm `PROJECT_LANGUAGE`.
2. Allocate next global TC id (scan `Test/**/test-cases/` and `Design/_index.md` if tracked).
3. Copy structure from `ai-framework/templates/test-case.template.yaml`.
4. Write file: `Test/{{AREA_NAME}}/test-cases/TC-XXXX-<slug>.yaml`
5. Update traceability in `Test/{{AREA_NAME}}/traceability/` if a matrix file exists.

## Output Quality

- Every step has explicit expected result.
- Preconditions are testable (not vague).
- Link at least one REQ with acceptance criteria covered.
- Use `PROJECT_LANGUAGE` for title, description, steps.

## Report

List file path, linked REQ ids, and suggested automation path if applicable.
