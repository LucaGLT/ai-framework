# Refactor Workflow

## Rules

- **No functional behaviour change** unless explicitly requested via REQ/CR
- Small incremental steps with tests green after each step

## Phases

1. **Scope** — document what will change and what will not
2. **Risk** — identify tests to add or run; affected modules
3. **Plan** — steps in TASK or PLAN.md
4. **Execute** — refactor in small commits
5. **Verify** — full test suite; review for accidental behaviour change
6. **Validate** — validation report (focus: maintainability, regression_risk)

## Must not

- Combine refactor with feature work in same task without separate REQ
