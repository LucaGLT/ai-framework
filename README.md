# AI Framework

Meta-framework AI riusabile per guidare lo sviluppo software con Cursor (primario) e GitHub Copilot (opzionale).

## Scopo

Questo repository **non è un'applicazione**. Contiene regole, prompt, template, workflow e adattatori IDE che vengono **istanziati** su un progetto software target con struttura **Design / Code / Test**.

## Documentazione autoritativa

Specifica completa: [`_RAW/ai-framework-guide_1.0.md`](_RAW/ai-framework-guide_1.0.md)

## Struttura

```text
├── _RAW/                 ← Guida di riferimento (solo documenti attivi)
├── core/                 ← Metodologia, lifecycle, quality gates
├── modules/
│   ├── design/           ← Requisiti, meeting, review
│   ├── coding/           ← Plan, review, docs, setup modulo
│   ├── test/             ← TC, bug, validation report
│   └── optional/         ← gui-theming, cpp-tooling
├── agents/               ← Ruoli agente
├── templates/            ← Template artefatti globali
├── workflows/            ← Workflow end-to-end
├── standards/            ← Standard tecnici
├── validators/           ← Rubric e scoring
├── adapters/
│   ├── cursor/           ← .mdc rules, mcp.json
│   ├── copilot/          ← Template .github
│   └── task-sync/        ← Stub integrazione issue tracker
├── scripts/              ← Validazione artefatti
├── docs/                 ← pilot-guide, automation
└── examples/             ← minimal-project skeleton
```

## Stato implementazione

| Fase | Contenuto | Stato |
|------|-----------|-------|
| 0 | Fondamenta: core + modules design/coding | Completata |
| 1 | Template, agents, validators, parameters unificato | Completata |
| 2 | Adattatori Cursor + Copilot, setup prompts, optional C++ | Completata |
| 3 | Modulo test + workflow end-to-end | Completata |
| 4 | Esempio minimal + pilot-guide | Completata |
| 5 | Script validazione + task-sync stub | Completata |

## Quickstart (progetto target)

1. Copiare il framework nel repository del progetto software (vedi `docs/pilot-guide.md`).
2. Eseguire `#project-setup` (Design).
3. Eseguire `#setup-environment` per ogni modulo (Code).
4. Seguire `workflows/end-to-end.workflow.md` o `core/lifecycle.md`.
5. Validare con `scripts/validate-artifacts.ps1`.

## Licenza

Uso interno — progetti personali e team GLT.
