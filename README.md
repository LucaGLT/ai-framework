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
│   ├── test/             ← (Fase 3) bug, TC, validation
│   └── optional/         ← Plug-in (gui-theming, C++ tooling, …)
├── agents/               ← Ruoli agente (Fase 1)
├── templates/            ← Template artefatti globali (Fase 1)
├── workflows/            ← Workflow end-to-end (Fase 1)
├── standards/            ← Standard tecnici (Fase 1)
├── validators/           ← Rubric e scoring (Fase 1)
├── adapters/
│   ├── cursor/           ← .mdc rules, mcp.json (Fase 2)
│   └── copilot/          ← Template .github (Fase 2)
├── docs/                 ← Documentazione utente
└── examples/             ← Esempi di istanziazione
```

## Stato implementazione

| Fase | Contenuto | Stato |
|------|-----------|-------|
| 0 | Fondamenta: core + modules design/coding | Completata |
| 1 | Template, agents, validators, parameters unificato | Completata |
| 2 | Adattatori Cursor + Copilot | Pianificata |
| 3 | Modulo test (prompt operativi) | Pianificata |

## Quickstart (progetto target)

1. Istanziare il framework nel repository del progetto software.
2. Eseguire `#project-setup` (Design).
3. Eseguire `#setup-environment` per ogni modulo (Code).
4. Seguire il lifecycle in `core/lifecycle.md`.

## Licenza

Uso interno — progetti personali e team GLT.
