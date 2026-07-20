# Copilot Adapter

Copy to target project on instantiation (dual adapter with Cursor):

| Source | Target |
|--------|--------|
| `copilot-instructions.template.md` | `.github/copilot-instructions.md` (resolve tokens, strip TEMPLATE NOTE) |
| `prompts/*.prompt.md` | `.github/prompts/` |
| `instructions/*.instructions.md` | `.github/instructions/` |
| `specs/*.yml` | `.github/specs/` (except `parameters.yml` — stays in meta-framework) |
| `templates/*.template.md` | `.github/templates/` |

## Instantiation

Triggered by `#project-setup` (Design) and `#setup-environment` (Code).

1. Resolve every token from `specs/parameters.yml` (meta-framework root) into `PROJECT_PARAMETERS.md`.
2. Substitute tokens in all generated `.github/` files.
3. Copy `.cursor/rules/` and `.cursor/mcp.json` from `adapters/cursor/` in parallel.

## Optional modules

When enabled during setup, also copy from `modules/optional/`:

| Module | Condition | Extra `.github/` files |
|--------|-----------|------------------------|
| `gui-theming` | `HAS_GUI_MODULE=true` | `instructions/gui-style.instructions.md`, `specs/gui-theme.yml`, GUI prompts |
| `cpp-tooling` | `LANGUAGE` in C/C++ | `.clang-format`, Doxygen config template at module root |

See `_RAW/ai-framework-guide_1.0.md` §10.2–10.3.
