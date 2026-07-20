# Minimal Project Example

Skeleton showing a target project after framework instantiation. **Not runnable code** — structure reference only.

```text
minimal-project/
├── PROJECT_PARAMETERS.md
├── AGENTS.md
├── README.md
├── _RAW/
├── ai-framework/              ← copy of meta-framework core
├── .cursor/
│   ├── rules/                 ← from adapters/cursor/
│   └── mcp.json
├── .github/                   ← from adapters/copilot/
│   ├── copilot-instructions.md
│   ├── prompts/
│   ├── instructions/
│   └── specs/
├── 01_Design/
│   ├── _index.md
│   ├── meetings/
│   └── areas/
│       └── backend/
│           ├── REQUIREMENTS.md
│           ├── TASKS.md
│           ├── architecture/
│           └── decisions/
├── 02_Code/
│   └── backend/
│       └── auth-service/
│           ├── README.md
│           ├── PLAN.md
│           ├── src/
│           └── test/
└── 03_Test/
    └── backend/
        ├── strategy/
        ├── test-cases/
        ├── integration/
        ├── reports/
        ├── bugs/
        └── traceability/
```

## Sample PROJECT_PARAMETERS.md (excerpt)

```markdown
## Project
- PROJECT_ID: minimal-demo
- PROJECT_NAME: Minimal Demo
- PROJECT_LANGUAGE: en
- CLIENT_NAME: Internal
- VALIDATION_GATE_ENABLED: false
- VALIDATION_THRESHOLD: 85

## Module: backend/auth-service
- AREA_NAME: backend
- MODULE_NAME: auth-service
- LANGUAGE: Python
- BUILD_SYSTEM: setuptools
- TESTING_FRAMEWORK: pytest
```

## Next Steps

1. Run `#project-setup` on a real repository (see `docs/pilot-guide.md`).
2. Run `#setup-environment` per module.
3. Execute `workflows/end-to-end.workflow.md` with one small REQ.
