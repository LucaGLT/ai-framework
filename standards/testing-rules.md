# Testing Rules

## Levels

| Level | Location |
|-------|----------|
| Unit | `02_Code/{{AREA}}/{{MODULE}}/test/` |
| Integration | `03_Test/{{AREA}}/integration/` |
| System / E2E | `03_Test/{{AREA}}/test-cases/` |

## Requirements

- Every Must REQ should have at least one linked TC or automated test
- Bug fixes should include a regression test when feasible
- Record test commands in validation report evidence

## Framework

Use `{{TESTING_FRAMEWORK}}` from module parameters (GoogleTest, pytest, Jest, …).

## Naming

- Test cases: `TC-XXXX` in YAML or markdown
- Test files: follow language convention (`test_*.py`, `*Test.cpp`, …)

## CI

Run via `{{CI_CD_TOOL}}` (default GitHub Actions) on push/PR when configured.
