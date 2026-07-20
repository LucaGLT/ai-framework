# Decision Policy

## When to record a decision

Create **DEC-XXXX** in `Design/areas/{{AREA}}/decisions/` when:

- the choice affects architecture or public API;
- alternatives were considered and one was rejected;
- the decision is hard to reverse;
- future agents or developers need context.

Skip DEC for obvious implementation details covered by coding standards.

## Decision record format

```markdown
# DEC-0001 — Short title

**Date:** YYYY-MM-DD
**Status:** proposed | accepted | superseded
**Linked REQ:** REQ-0001, REQ-0002

## Context

What problem or question triggered this decision?

## Decision

What was decided?

## Rationale

Why this option?

## Consequences

Positive and negative effects.

## Alternatives considered

- Option A — rejected because …
- Option B — rejected because …
```

## Ambiguity policy

If the user request is ambiguous:

1. State reasonable assumption explicitly.
2. Document assumption in REQ notes or DEC.
3. Continue — do not block on minor ambiguity.
4. Flag for user confirmation on high-impact assumptions.

## Framework evolution policy

Changes to this meta-framework:

- Separate commits from application project changes.
- Update `_RAW/ai-framework-guide_1.0.md` for structural decisions (version bump).
- Prefer minimal patches; avoid duplicate rules across core and adapters.

## Adopted architectural decisions (summary)

See `_RAW/ai-framework-guide_1.0.md` §2 for the full list (D1–D22).

Key points:

- Markdown primary for REQ; YAML for automation
- Global REQ IDs (`REQ-0001`, …)
- File-based tasks; no Atlassian in v1
- Cursor + Copilot dual adapters
- `CLIENT_NAME` default `Internal`
- GitHub + GitHub Actions as defaults
