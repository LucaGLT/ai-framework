# Commit Rules

## Message format

```
<type>(<scope>): <short summary>

Optional body with why, not what.
```

Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`

## Separation

- **Framework changes** (this meta-framework repo) — separate commits from target app work
- Do not mix framework template updates with application code in target projects

## Scope

- One logical change per commit when possible
- Reference TASK or REQ in body when applicable: `Refs: REQ-0042, TASK-0010`

## Prohibited

- Force push to `main` without explicit team agreement
- Commit secrets, `.env`, credentials

## Language

Commit messages may use `{{PROJECT_LANGUAGE}}` on target projects; meta-framework uses English.
