# Pilot Guide

Apply the AI Framework to a **separate software repository** (not this meta-framework repo).

## 1. Choose pilot project

Pick a small, real codebase:

- C++ library, web app, firmware, or backend+frontend mix
- Team size 2–5 recommended
- GitHub + GitHub Actions preferred

## 2. Copy framework into pilot repo

Option A — subtree or copy:

```powershell
# From pilot repo root
git clone git@github.com:LucaGLT/ai-framework.git _framework_tmp
Copy-Item -Recurse _framework_tmp/* ./ai-framework/
Copy-Item _framework_tmp/templates/AGENTS.md.template ./AGENTS.md.template
Remove-Item -Recurse _framework_tmp
```

Option B — manual: copy `core/`, `modules/`, `agents/`, `templates/`, `workflows/`, `standards/`, `validators/`, `adapters/`, `_RAW/ai-framework-guide_1.0.md`.

## 3. Run `#project-setup`

In Cursor (or Copilot with `.github/` prompts):

1. Execute `#project-setup` from `modules/design/prompts/project-setup.prompt.md`
2. Verify `PROJECT_PARAMETERS.md` has no unresolved `{{...}}`
3. Confirm `Design/`, `Code/`, `Test/` trees exist

## 4. Run `#setup-environment`

For each code module:

1. Execute `#setup-environment`
2. Verify `.cursor/rules/` and `.github/` are populated
3. Confirm `Code/{{AREA}}/{{MODULE}}/` scaffold

## 5. First operational cycle

Follow `workflows/end-to-end.workflow.md`:

1. One REQ (`#req-create`)
2. One TASK + PLAN update
3. Minimal implementation + unit test
4. One TC (`#test-case-create`)
5. Validation report (`#validation-report`)

## 6. Enable validation gate (after pilot)

When the team is comfortable:

1. Set `VALIDATION_GATE_ENABLED=true` in `PROJECT_PARAMETERS.md`
2. Set `VALIDATION_THRESHOLD` (default 85)
3. Re-run validation on a completed task to confirm gate behaviour

## 7. Document lessons learned

Add notes to pilot repo `docs/lessons-learned.md`:

- Prompt gaps
- Rubric threshold adjustments
- Optional modules used (gui-theming, cpp-tooling)
- IDE adapter issues (Cursor vs Copilot)

Feed improvements back to `LucaGLT/ai-framework` via PR.

## Checklist

- [ ] Pilot repo chosen and isolated from meta-framework
- [ ] `#project-setup` completed
- [ ] At least one module via `#setup-environment`
- [ ] End-to-end workflow completed once
- [ ] Validation gate decision documented
- [ ] Lessons learned captured
