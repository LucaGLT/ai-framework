---
mode: agent
description: "Initial project wizard: interview, PROJECT_PARAMETERS.md, Design/Code/Test tree, AGENTS.md, IDE adapters."
---

# Project Setup

Guide the user through initial project configuration and generate the Design / Code / Test structure
with dual IDE adapters (Cursor + Copilot).

Reference: `specs/parameters.yml` (meta-framework root), `templates/milestone-catalog.md`.

---

## Step 0 — Detect Existing Setup

1. If `PROJECT_PARAMETERS.md` exists, read it and ask only for missing or changed values.
2. Otherwise run the full project interview below.

---

## Phase A — Project Identity (single message)

Ask all questions together:

```
1. PROJECT_ID — URL-safe identifier (kebab-case). Example: iot-monitor
2. PROJECT_NAME — Human-readable name
3. PROJECT_DESCRIPTION — 1-2 sentences
4. PROJECT_LANGUAGE — it OR en (all artifacts in one language, never mixed)
5. CLIENT_NAME — Client name (default: Internal)
6. TEAM_OR_AUTHOR — Team or author (default: Development Team)
7. WORKFLOW_TYPE — Agile | Waterfall | Hybrid | V-Model (default: Agile)
8. REPOSITORY_URL — Git remote (optional)
9. MILESTONE_LIST — Comma-separated IDs from milestone-catalog.md or custom (optional)
10. DOMAIN_RULES — Project-specific tools, formats, constraints for AI (optional bullets)
```

---

## Phase B — Areas of Intervention

```
11. AREAS — List 2-10 logical areas (backend, embedded, system, …).
    Each area gets Design/areas/{{AREA}}/ and optionally Code/ and Test/ subtrees.
12. ARCHITECTURE_AREA — Dedicated area for cross-cutting decisions? (default: yes → "system")
```

Propose sensible defaults from PROJECT_DESCRIPTION if the user is unsure.

---

## Phase C — Confirm Summary

Present a markdown summary. Wait for explicit **Yes** before generating files.

---

## Output — Generate in Order

### 1. `PROJECT_PARAMETERS.md`

Write at project root with all resolved tokens. **Gate:** zero unresolved `{{...}}`.

### 2. Directory tree

```text
_RAW/
Design/
├── _index.md
├── meetings/
└── areas/{{AREA}}/
    ├── REQUIREMENTS.md
    ├── TASKS.md
    ├── architecture/
    └── decisions/
Code/
Test/
  └── {{AREA}}/
      ├── strategy/
      ├── test-cases/
      ├── integration/
      ├── reports/
      ├── bugs/
      └── traceability/
ai-framework/          ← copy from meta-framework (if not present)
```

For each area, seed `REQUIREMENTS.md` from `modules/design/templates/req-area-file.template.md`.

Initialize `Design/_index.md` with empty REQ tables (columns: ID, Area, Type, MoSCoW, Priority, Status).

### 3. `AGENTS.md`

From `templates/AGENTS.md.template` with tokens resolved.

### 4. Cursor adapter

Copy `adapters/cursor/rules/*.mdc` → `.cursor/rules/`
Copy `adapters/cursor/mcp.json` → `.cursor/mcp.json`

### 5. Copilot adapter

Copy `adapters/copilot/` contents into `.github/` (same mapping as `#setup-environment` Step 4).
Resolve tokens in `copilot-instructions.template.md` → `.github/copilot-instructions.md`.

### 6. Completion checklist

```markdown
## Setup checklist
- [ ] PROJECT_PARAMETERS.md complete (no {{...}})
- [ ] Design/_index.md and area REQUIREMENTS.md created
- [ ] AGENTS.md at project root
- [ ] .cursor/rules/ and .cursor/mcp.json active
- [ ] .github/copilot-instructions.md and prompts present
- [ ] Git initialized; remote configured
- [ ] Run #setup-environment for each Code module
```

---

## Incomplete Answers

| Situation | Action |
|-----------|--------|
| Empty optional field | Use registry default; note in summary |
| Generic area name | Ask for specificity |
| More than 10 areas | Suggest merging similar areas |
| Unknown areas | Propose 3-5 from project description |

---

## Language Rule

All generated artifact text must use `PROJECT_LANGUAGE` consistently (Italian **or** English, never mixed).
