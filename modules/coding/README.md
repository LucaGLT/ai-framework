# Coding Module

Parametric templates for **Code** pillar: setup, planning, review, documentation and coding specs.

> Migrated from `Orig_Data/02.Coding`. Becomes active on target project after `#setup-environment`.

---

## Purpose

Machine-readable specs, instructions and prompts for module development. Uses placeholder tokens
(`{{PROJECT_NAME}}`, etc.) resolved via interview into `PROJECT_PARAMETERS.md`.

Registry: [`specs/parameters.yml`](specs/parameters.yml)

## Quickstart (target project)

1. Run [`prompts/setup-environment.prompt.md`](prompts/setup-environment.prompt.md).
2. Answer the interview (see [`instructions/environment-setup.instructions.md`](instructions/environment-setup.instructions.md)).
3. Prompt creates `Code/{{AREA}}/{{MODULE}}/` and instantiates IDE adapters (Phase 2).

## Folder Map

| Path | Content |
|------|---------|
| [`copilot-instructions.template.md`](copilot-instructions.template.md) | Workspace policy template |
| [`specs/parameters.yml`](specs/parameters.yml) | Placeholder token registry |
| [`specs/plan-schema.yml`](specs/plan-schema.yml) | Schema for `PLAN.md` |
| [`specs/review-plan-schema.yml`](specs/review-plan-schema.yml) | Schema for `REVIEW.md` |
| [`specs/coding-style.yml`](specs/coding-style.yml) | Machine-readable coding rules |
| [`specs/module-structure.yml`](specs/module-structure.yml) | Module folder layout |
| `instructions/` | Prose rules (glob-based) |
| `prompts/` | Agent workflows |

## Optional modules

GUI theming (Python/Qt) lives in [`../optional/gui-theming/`](../optional/gui-theming/README.md)
when `{{HAS_GUI_MODULE}} = true`.

## Core prompts

| Prompt | Purpose |
|--------|---------|
| `#setup-environment` | Module interview + scaffold |
| `#new-module` | New `PLAN.md` |
| `#update-plan` | Update roadmap |
| `#new-component` | Scaffold class/component |
| `#review-code` | Structured review → `REVIEW.md` |
| `#generate-docs` | Doc-comment blocks |

## Placeholder convention

- Syntax: `{{TOKEN_NAME}}`
- Documented in `specs/parameters.yml`
- Never leave unresolved tokens in instantiated files
