# Quality Gates

## Definition of Done (DoD)

A task is **done** only when all applicable items below are satisfied:

- [ ] Linked REQ acceptance criteria met
- [ ] REQ has **Type**, **MoSCoW**, **Priority** populated
- [ ] Required tests added or updated and **passing**
- [ ] Public API / behaviour documented per `{{DOC_COMMENT_STYLE}}`
- [ ] Known bugs recorded as BUG-XXXX in `Test/{{AREA}}/bugs/`
- [ ] Validation report produced (when validation gate is active)
- [ ] Validation score ≥ `{{VALIDATION_THRESHOLD}}` (when gate active)
- [ ] No open **blocking** issues
- [ ] Final report written in `{{PROJECT_LANGUAGE}}`

## Validation gate activation

| Meta-framework phase | Validation gate |
|---------------------|-----------------|
| v1 (Phases 0–1) | Templates present; gate **recommended** not enforced |
| After pilot (Phase 2+) | Gate **mandatory** for task completion |

Configure in `PROJECT_PARAMETERS.md`:

```yaml
VALIDATION_GATE_ENABLED: false   # v1 default
VALIDATION_THRESHOLD: 85
```

## Blocking conditions

From `validators/validation-rubric.yaml`:

- missing_required_tests
- failing_tests
- undocumented_public_api
- requirement_not_implemented
- unsafe_data_handling
- breaking_change_not_declared

Any blocking condition caps score and prevents completion.

## Scoring weights (summary)

| Category | Weight |
|----------|--------|
| requirement_coverage | 20 |
| correctness | 20 |
| maintainability | 15 |
| test_coverage | 15 |
| documentation_quality | 10 |
| error_handling | 10 |
| architectural_consistency | 5 |
| security_privacy_impact | 3 |
| regression_risk | 2 |

Full rubric: `validators/validation-rubric.yaml` (Phase 1).

## Pre-launch checklist (new target project)

- [ ] `PROJECT_PARAMETERS.md` complete (no unresolved `{{...}}`)
- [ ] `#project-setup` executed — Design structure created
- [ ] At least one module via `#setup-environment`
- [ ] Design / Code / Test tree verified
- [ ] `AGENTS.md` and IDE adapters instantiated
- [ ] Git remote tested
- [ ] Artifact ID conventions agreed with team
