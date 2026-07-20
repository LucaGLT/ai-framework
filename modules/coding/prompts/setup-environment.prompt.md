---
mode: agent
description: "Interview for module parameters, then instantiate Code structure and IDE adapters (.cursor/, .github/, AGENTS.md)."
---

# Setup Environment

Prepare or extend a module in the target project by resolving parameters from `specs/parameters.yml`
(meta-framework root) and instantiating the AI framework into `.github/`, `.cursor/`, and `Code/{{AREA}}/{{MODULE}}/`.

Follow `instructions/environment-setup.instructions.md` for interview policy and validation.

---

## Step 0 — Detect Existing Setup

1. Read `PROJECT_PARAMETERS.md` at the target project root if present.
2. Treat resolved parameters as pre-filled; ask only for missing or changed values.
3. If absent, this is first-time module setup — run the full module interview.

---

## Input Required (Interview)

Ask parameters grouped as in `specs/parameters.yml`, in order:

1. **Area & Module** — `AREA_NAME`, `MODULE_NAME`, `MODULE_PURPOSE`, `MODULE_ROOT_PATH`,
   `HAS_DEDICATED_REPO`, `BUILD_SYSTEM`, `TESTING_FRAMEWORK`, `MODULE_PREFIX`.
2. **Naming** — namespace and convention tokens (offer registry defaults).
3. **Language & Style** — `LANGUAGE`, `LANGUAGE_STANDARD`, `LANGUAGE_FILE_EXTENSIONS`, formatting.
4. **Documentation** — `DOC_COMMENT_STYLE`, `API_DOC_SUFFIX`.
5. **Structure** — `ALLOW_EXTERNAL_DEPENDENCIES`, `CROSS_MODULE_POLICY`.
6. **Versioning** — `VERSIONING_SCHEME`.
7. **Optional GUI** — `HAS_GUI_MODULE` and dependents if true.
8. **Optional C++** — if `LANGUAGE` is C or C++: confirm Doxygen + `.clang-format` (default yes).

Rules:

- Never invent values for `required: true` parameters.
- Show optional defaults and ask for confirmation.
- Skip parameters whose `depends_on` is false.
- Derive computed tokens automatically.

---

## Step 1 — Summarize and Confirm

Present a table (id → value → source). Get explicit confirmation before writing files.

---

## Step 2 — Persist Parameters

Append or update the module section in `PROJECT_PARAMETERS.md` at the project root.

---

## Step 3 — Create Module Structure

Create under the target project:

```text
Code/{{AREA_NAME}}/{{MODULE_NAME}}/
├── README.md
├── PLAN.md
├── src/
└── test/
```

Scaffold `PLAN.md` from `ai-framework/templates/` conventions and `specs/plan-schema.yml`.

If `HAS_DEDICATED_REPO` is `true`, note the module in `EXTERNAL_REPOSITORIES.md`.

---

## Step 4 — Instantiate Copilot Adapter (`.github/`)

Copy from meta-framework `adapters/copilot/`, substituting every `{{TOKEN}}`:

| Source | Target |
|--------|--------|
| `copilot-instructions.template.md` | `.github/copilot-instructions.md` (strip TEMPLATE NOTE) |
| `prompts/*.prompt.md` | `.github/prompts/` |
| `instructions/*.instructions.md` | `.github/instructions/` |
| `specs/*.yml` | `.github/specs/` |

Do **not** copy `parameters.yml` — it stays in the meta-framework only.

When substituting tokens inside glob brace syntax (e.g. `**/*.{{{LANGUAGE_FILE_EXTENSIONS}}}`),
replace only the inner `{{TOKEN}}` and preserve outer braces.

---

## Step 5 — Instantiate Cursor Adapter (`.cursor/`)

Copy from meta-framework `adapters/cursor/`:

| Source | Target |
|--------|--------|
| `rules/*.mdc` | `.cursor/rules/` |
| `mcp.json` | `.cursor/mcp.json` |

---

## Step 6 — Instantiate AGENTS.md

If missing or outdated, copy `templates/AGENTS.md.template` → `AGENTS.md` at project root with tokens resolved.

---

## Step 7 — Optional Modules

If `HAS_GUI_MODULE` is `true`, copy from `modules/optional/gui-theming/`:

- `instructions/gui-style.instructions.md` → `.github/instructions/`
- `specs/gui-theme.yml` → `.github/specs/`
- `prompts/*.prompt.md` → `.github/prompts/`

Append the GUI section into `.github/copilot-instructions.md` (uncommented, tokens resolved).

If `LANGUAGE` is C or C++, copy from `modules/optional/cpp-tooling/`:

- `templates/.clang-format` → module root `Code/{{AREA}}/{{MODULE}}/.clang-format`
- `templates/Doxyfile` → module root `Code/{{AREA}}/{{MODULE}}/Doxyfile` (resolve tokens)

Skip optional modules when conditions are false.

---

## Step 8 — Report

List every file created or updated. Confirm zero unresolved registered tokens in generated files.
State which optional modules were included.

---

## Constraints

- Never overwrite existing files without explicit confirmation.
- Never leave unresolved `{{TOKEN}}` in generated output.
- Do not modify meta-framework source files — copy and substitute only.
- Preserve `ai-framework/` copy in the target project unchanged unless `#project-setup` already ran.
