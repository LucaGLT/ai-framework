# Methodology

## Purpose

Define how AI agents and humans collaborate on software projects using this framework.

## Principles

1. **Framework first** — build or load the working system before application code.
2. **Structured artifacts** — requirements, tasks, tests and bugs are file-based and versioned.
3. **Traceability** — every implementation links back to REQ; every test links to REQ or TC.
4. **Incremental delivery** — small steps, frequent validation, no big-bang commits.
5. **Single language per project** — all project artifacts use `{{PROJECT_LANGUAGE}}` (`it` or `en`), never mixed.
6. **IDE-agnostic core** — rules live in `ai-framework/`; Cursor and Copilot are adapters only.

## Three pillars on target projects

| Pillar | Responsibility |
|--------|----------------|
| **Design** | Requirements, architecture, decisions, meetings |
| **Code** | Implementation modules, PLAN.md, unit tests |
| **Test** | Test cases, integration, bugs, reports, traceability |

Areas of intervention (`{{AREA_NAME}}`) organize content inside each pillar.

## Roles (simulated by the agent)

Planner → Architect → Developer → Tester → Reviewer → Validator → Bug Manager → Documentation Specialist.

See `agents/` for role definitions (Phase 1).

## When to skip ceremony

Trivial tasks (typo fix, single-line doc) may skip full REQ creation if they do not change behaviour or requirements. The agent must still run relevant checks before marking done.

## References

- Lifecycle: `core/lifecycle.md`
- Quality gates: `core/quality-gates.md`
- Decisions: `core/decision-policy.md`
- Authoritative spec: `_RAW/ai-framework-guide_1.0.md`
