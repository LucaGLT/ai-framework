# Coding Rules

Apply per-module specs: `modules/coding/specs/coding-style.yml` and `instructions/coding-style.instructions.md`.

## General principles

- Prefer simple, maintainable code
- Avoid unnecessary abstractions
- Keep functions focused; single responsibility
- Explicit types where the language supports/requires them
- Handle errors explicitly; no silent failures
- Preserve public APIs unless REQ requires change
- No hidden global mutable state

## Per-project overrides

Resolved via `PROJECT_PARAMETERS.md` and module setup (`LANGUAGE`, `INDENT_STYLE`, naming tokens).

## Tests

Add or update tests for behaviour changes — not implementation details.
