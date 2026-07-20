# AI Framework Guide — v1.0

**Versione:** 1.0  
**Stato:** documento di riferimento unificato  
**Scopo:** definire in modo coerente e non ambiguo il meta-framework AI da costruire in questo repository e il modo in cui viene istanziato su un progetto software target.

**Fonti fuse (e riconciliate):**

- `ai-framework-setup-guide_2.0.md` — struttura progetto, parametri, setup operativo
- `Analisi_Prelminare.md` — inventario materiale esistente, decisioni architetturali, piano di implementazione
- `cursor_ai_development_framework.md` — lifecycle, agenti, template, validation loop, Cursor rules

---

## 1. Visione e principi

### 1.1 Cosa è questo progetto

Questo repository **non produce software applicativo**. Produce un **meta-framework AI** — un sistema di regole, prompt, template, workflow e adattatori IDE — che, una volta customizzato, guida un agente AI (e il team) nello sviluppo di un progetto software specifico in modo **standardizzato, tracciabile e versionato**.

### 1.2 Filosofia operativa

```text
Prima costruisci il framework.
Poi usalo per costruire il progetto.
Poi miglioralo in base agli errori che emergono.
```

Non chiedere all'agente «costruisci tutto». Chiedigli di seguire il framework fase per fase.

### 1.3 Principi architetturali (non negoziabili)

| # | Principio | Implicazione |
|---|-----------|--------------|
| P1 | **Core agnostico dall'IDE** | Tutta la logica comune vive in `ai-framework/` |
| P2 | **Adattatori separati** | Cursor (primario) e Copilot (opzionale) non duplicano il core |
| P3 | **Artefatti testuali versionati** | YAML, JSON, Markdown nel repository Git |
| P4 | **Parametrizzazione** | Placeholder `{{TOKEN}}` risolti via interview → `PROJECT_PARAMETERS.md` |
| P5 | **Modularità** | File piccoli, un solo scopo per file; optional modules plug-in |
| P6 | **Tracciabilità** | Ogni task, bug, test case collegato a REQ |
| P7 | **Definition of Done oggettiva** | Validation report + rubric con soglia configurabile |
| P8 | **Indipendenza organizzativa** | Nessun vincolo Akkodis, Atlassian o nomenclature aziendali |

### 1.4 Lifecycle end-to-end

```text
_RAW/ (materiale grezzo)
    ↓
Design  →  REQ, decisioni, architettura
    ↓
Code    →  moduli, PLAN.md, implementazione
    ↓
Test    →  TC, bug, report, traceability
    ↓
Validation loop  →  score ≥ soglia
    ↓
Definition of Done
```

Equivalente formale (agenti):

```text
Requisiti testuali → Analisi → Pianificazione → Task → Implementazione
→ Testing → Bug collection → Validazione → Correzione iterativa → DoD
```

---

## 2. Decisioni adottate

Queste decisioni risolvono i conflitti tra i tre documenti sorgente. **Non sono aperte a reinterpretazione** salvo revisione esplicita di questa guida.

| ID | Domanda | Decisione |
|----|---------|-----------|
| D1 | Formato requisiti | **Markdown primario** (`REQ-XXXX` in `Design/areas/.../REQUIREMENTS.md`) + **YAML opzionale** (`requirement.template.yaml`) per automazione/export |
| D2 | Entry point agente | **`AGENTS.md`** (IDE-agnostic) + adattatori IDE |
| D3 | IDE target | **Dual Cursor + Copilot fin da v1** — Cursor primario, adattatore Copilot incluso e testato |
| D4 | Pianificazione | **`PLAN.md`** = roadmap modulo; **`task.template.yaml`** = unità esecuzione linkata a REQ |
| D5 | Naming cartella core | **`ai-framework/`** |
| D6 | Materiale sorgente | **`Orig_Data/02.Coding`** canonical; **`Orig_Data/xx.DA_SISTEMARE`** solo archivio |
| D7 | Validation score | **Template e rubric in v1**; gate obbligatorio **Fase 2** (dopo progetto pilota). Soglia default 85 |
| D8 | Lingua operativa | **Per progetto: tutto IT oppure tutto EN — mai misto.** Default IT. Template del meta-framework in EN |
| D9 | Alberatura progetto target | **Design / Code / Test** × **Aree di intervento** |
| D10 | Task management | **File-based nel repo**; nessuna integrazione Atlassian; adattatore esterno opzionale in futuro |
| D11 | Identificatore progetto | **`PROJECT_ID`** libero (kebab-case consigliato); nessuna logica di composizione automatica |
| D12 | Documentazione codice | **Parametrica** via `{{DOC_COMMENT_STYLE}}` (Doxygen, JSDoc, docstring, …); non hard-coded su C++ |
| D13 | ID requisiti | **Globale sequenziale** — `REQ-0001`, `REQ-0002`, …; indice in `Design/_index.md` |
| D14 | Utenti framework | **Team piccolo (2–5)** — checklist rigorose, setup interview, doc chiara |
| D15 | Dogfooding | **No** — questo repo = meta-framework + `_RAW`; il pilota è un repo separato |
| D16 | Optional modules v1 | **Core agnostic + C++** (Doxygen, tooling) **+ Python/Web** (gui-theming, frontend) |
| D17 | Git hosting default | **GitHub**; CI default **GitHub Actions** |
| D18 | Cliente | **`CLIENT_NAME`** opzionale; default **`Internal`** se non specificato |
| D19 | Classificazione REQ | **Obbligatoria:** Tipo + MoSCoW + Priorità su ogni REQ |
| D20 | Milestone | **Customizzabili per progetto** — nessun set fisso nel core; catalogo suggerimenti per tipologia (§2.3) |
| D21 | MCP Cursor | **Scheletro `mcp.json`** con placeholder fin da v1 |
| D22 | Progetti pilota tipici | Libreria C++, app web, firmware, mix backend+frontend |

### 2.1 Elementi esplicitamente esclusi

| Elemento | Motivo |
|----------|--------|
| `CLIENT_NAME_FULL`, `CLIENT_CODE`, `DU_CODE`, `DU_LIST` | Vincoli Akkodis |
| `PROJECT_FREE_ID` con regole Akkodis | Sostituito da `PROJECT_ID` |
| `PROJECT_KEY`, `PROJECT_MANAGER`, `HEAD_OF_DPE` | Organizzativi / Jira |
| `ATLASSIAN_TOOLS`, `jira-projection.yml` | Nessuna integrazione Atlassian |
| Alberatura numerica (`1100_system`, `1900_firmware`, …) | Sostituita da Design/Code/Test |
| `Generate-ProjectCodes.ps1` con liste ufficiali | Script Akkodis-specific |
| Milestone fisse nel core (`M1-prototype`, `M2-beta`, …) | Troppo generiche; sostituite da catalogo customizzabile (§2.3) |
| Lingua mista IT/EN nello stesso progetto | Vietata — una sola lingua per progetto (`{{PROJECT_LANGUAGE}}`) |

### 2.2 Regola lingua (dettaglio)

| Scope | Lingua | Note |
|-------|--------|------|
| Meta-framework (`ai-framework/`, template, rules) | **EN** | Stabilità e riuso |
| Progetto target (REQ, meeting, PLAN, doc utente) | **`{{PROJECT_LANGUAGE}}`** | `it` (default) oppure `en` — scelta al `#project-setup`, immutabile salvo migrazione esplicita |
| Codice sorgente (commenti, doc API) | **`{{PROJECT_LANGUAGE}}`** | Allineato al progetto, non al meta-framework |

> **Vietato:** REQ in italiano e PLAN in inglese nello stesso progetto. L'agente deve rifiutare o segnalare inconsistenze linguistiche.

### 2.3 Catalogo milestone suggerite (customizzabili)

Le milestone **non sono obbligatorie** e **non sono prefissate** nel framework. Al `#project-setup` l'utente può:

- ometterle del tutto;
- scegliere dal catalogo sotto;
- definire milestone custom (`{{MILESTONE_ID}}` + descrizione).

Il framework persiste la lista scelta in `PROJECT_PARAMETERS.md` come `{{MILESTONE_LIST}}`.

#### Libreria C++

| ID suggerito | Significato |
|--------------|-------------|
| `api-surface-defined` | API pubblica e header estabiliti |
| `api-frozen` | Breaking change vietati salvo major version |
| `first-downstream-consumer` | Primo modulo esterno integrato con successo |
| `performance-baseline` | Benchmark e budget prestazionali documentati |
| `docs-complete` | API reference e guide d'uso complete |

#### App web / frontend

| ID suggerito | Significato |
|--------------|-------------|
| `ux-wireframes-approved` | Wireframe e flussi utente approvati |
| `auth-flow-complete` | Registrazione, login, sessioni funzionanti |
| `core-journey-shippable` | User journey principale deployabile |
| `accessibility-pass` | WCAG / criteri accessibilità verificati |
| `production-deploy` | Deploy su ambiente produzione |

#### Firmware / embedded

| ID suggerito | Significato |
|--------------|-------------|
| `board-bring-up` | Hardware acceso, debug, clock, memoria OK |
| `bootloader-flashing` | Flash e boot da ROM/RAM verificati |
| `hal-peripherals-ready` | HAL driver periferiche base completi |
| `app-logic-integrated` | Logica applicativa su RTOS/bare-metal integrata |
| `field-trial-ready` | Pronto per prova su banco o campo |

#### Mix backend + frontend

| ID suggerito | Significato |
|--------------|-------------|
| `contract-defined` | API contract (OpenAPI/AsyncAPI) congelato |
| `backend-api-live` | Endpoint core deployati e testati |
| `frontend-wired` | UI collegata al backend reale |
| `e2e-critical-paths` | Test end-to-end sui flussi critici verdi |
| `staging-signoff` | Validazione su ambiente staging completata |

#### Trasversali (qualunque tipologia)

| ID suggerito | Significato |
|--------------|-------------|
| `requirements-baseline` | Set REQ approvato come baseline |
| `architecture-signoff` | Architettura revisionata e accettata |
| `integration-complete` | Componenti integrati, nessun stub critico |
| `hardening-complete` | Bug fix, security review, stabilità |
| `release-candidate` | Candidato rilascio, solo fix blocker ammessi |

---

## 3. Due livelli: meta-framework vs progetto target

### 3.1 Repository meta-framework (`Cursor-AI-Framework`)

Contiene il framework riusabile **pronto all'istanziazione**:

```text
Cursor-AI-Framework/
├── _RAW/                          ← Appunti grezzi, analisi, guide (questo documento)
│   └── Orig_Data/                 ← Materiale sorgente da migrare (archivio)
│
├── ai-framework/                  ← CORE agnostico IDE
│   ├── README.md
│   ├── core/
│   │   ├── methodology.md
│   │   ├── lifecycle.md
│   │   ├── quality-gates.md
│   │   └── decision-policy.md
│   ├── modules/
│   │   ├── design/                ← REQ, meeting, review (da Orig_Data/01.Design)
│   │   ├── coding/                ← plan, review, docs (da Orig_Data/02.Coding)
│   │   ├── test/                  ← bug, TC, validation
│   │   └── optional/              ← gui-theming, altri plug-in
│   ├── agents/
│   ├── templates/
│   ├── workflows/
│   ├── standards/
│   └── validators/
│
├── adapters/
│   ├── cursor/                    ← rules .mdc, skills, mcp.json (placeholder)
│   └── copilot/                   ← .github template (v1, pari a Cursor)
│
├── AGENTS.md                      ← Entry point generico (template)
├── docs/                          ← Documentazione utente
└── examples/                      ← Istanza minimal di framework applicato
```

### 3.2 Repository progetto target (dopo istanziazione)

Quando il framework viene applicato a un progetto software:

```text
<project-root>/
├── PROJECT_PARAMETERS.md          ← SSOT parametri (zero {{...}} irrisolti)
├── README.md
├── EXTERNAL_REPOSITORIES.md       ← Solo se moduli con repo dedicata
├── AGENTS.md                      ← Istanziato dal template
│
├── _RAW/                          ← Input grezzo non strutturato
│
├── Design/
│   ├── _index.md                  ← Indice master REQ multidimensionale
│   ├── meetings/                  ← Minute formalizzate (post #meeting-digest)
│   └── areas/
│       └── {{AREA_NAME}}/
│           ├── REQUIREMENTS.md    ← REQ-XXXX (formato primario)
│           ├── TASKS.md           ← TASK-XXXX (file-based)
│           ├── architecture/
│           └── decisions/         ← DEC-XXXX
│
├── Code/
│   └── {{AREA_NAME}}/
│       └── {{MODULE_NAME}}/
│           ├── README.md
│           ├── PLAN.md
│           ├── .project.yml       ← Opzionale
│           ├── src/
│           └── test/              ← Test unitari del modulo
│
├── Test/
│   └── {{AREA_NAME}}/
│       ├── strategy/
│       ├── test-cases/            ← TC-XXXX
│       ├── integration/
│       ├── reports/
│       ├── bugs/                  ← BUG-XXXX
│       └── traceability/
│
├── ai-framework/                  ← Copia/istanza del core
├── .cursor/                       ← Adattatore Cursor (rules + mcp.json)
└── .github/                       ← Adattatore Copilot (v1)
```

### 3.3 Relazione tra i due livelli

| Meta-framework | → | Progetto target |
|----------------|---|-----------------|
| `ai-framework/modules/design/` | → | Prompt `#project-setup`, struttura `Design/` |
| `ai-framework/modules/coding/` | → | Prompt `#setup-environment`, struttura `Code/` |
| `ai-framework/modules/test/` | → | Prompt test/bug, struttura `Test/` |
| `adapters/cursor/` | → | `.cursor/rules/` |
| `adapters/copilot/` | → | `.github/` |
| `ai-framework/templates/` | → | Template artefatti nel progetto |
| Registry parametri | → | `PROJECT_PARAMETERS.md` |

---

## 4. Materiale sorgente esistente (`Orig_Data/`)

Inventario e ruolo — **non va copiato così com'è** nel framework finale.

| Cartella | Contenuto | Azione |
|----------|-----------|--------|
| `01.Design` | Kit REQ, meeting, review; flusso `_raw` → REQ | Migrare in `ai-framework/modules/design/` |
| `02.Coding` | Framework parametrico: `parameters.yml`, prompt, specs, optional GUI | **Sorgente canonical** → `ai-framework/modules/coding/` |
| `xx.DA_SISTEMARE` | game_lib `.github`, duplicati, dati di gioco | Archivio; estrarre solo ciò che serve; escludere `.cache`, piani dominio |

**Stato di maturità stimato:** ~70% concettualmente implementato; ~30% da integrare (Cursor adapter, validation operativa, unificazione registry).

---

## 5. Parametri e registry

### 5.1 Registry unico

File canonical: `ai-framework/modules/coding/specs/parameters.yml` esteso con parametri Design e Test.

Sintassi placeholder: `{{TOKEN_NAME}}`. Ogni token documentato con: `required`, `default`, `depends_on`, `description`, `example`.

### 5.2 Parametri livello progetto (obbligatori al setup)

| Token | Tipo | Note |
|-------|------|------|
| `{{PROJECT_ID}}` | string | Identificatore libero, kebab-case consigliato |
| `{{PROJECT_NAME}}` | string | Nome leggibile |
| `{{PROJECT_DESCRIPTION}}` | string | Descrizione sintetica |
| `{{PROJECT_VERSION}}` | string | Default `0.1.0` |
| `{{PROJECT_LANGUAGE}}` | enum | `it` (default) / `en` — **tutto il progetto in una sola lingua** |
| `{{CLIENT_NAME}}` | string | Default `Internal` |
| `{{WORKFLOW_TYPE}}` | enum | Agile / Waterfall / Hybrid / V-Model |
| `{{REPOSITORY_URL}}` | url | Default pattern GitHub |
| `{{DEFAULT_BRANCH}}` | string | Default `main` |
| `{{CI_CD_TOOL}}` | enum | Default `GitHub Actions` |
| `{{TEAM_OR_AUTHOR}}` | string | Default `Development Team` |
| `{{VALIDATION_THRESHOLD}}` | integer | Default `85` (gate attivo da Fase 2) |
| `{{MILESTONE_LIST}}` | list | Opzionale; scelte da catalogo §2.3 o custom |

### 5.3 Parametri livello area / modulo

| Token | Tipo | Note |
|-------|------|------|
| `{{AREA_NAME}}` | string | Area di intervento (`backend`, `embedded`, `system`, …) |
| `{{MODULE_NAME}}` | string | Modulo dentro l'area |
| `{{MODULE_ROOT_PATH}}` | path | Derivato: `Code/{{AREA_NAME}}/{{MODULE_NAME}}/` |
| `{{MODULE_PURPOSE}}` | string | Scopo in una frase |
| `{{LANGUAGE}}` | enum | Linguaggio principale |
| `{{BUILD_SYSTEM}}` | enum | CMake, npm, Cargo, … |
| `{{TESTING_FRAMEWORK}}` | enum | GoogleTest, pytest, Jest, … |
| `{{HAS_DEDICATED_REPO}}` | boolean | Codice in repo separata? |
| `{{DOC_COMMENT_STYLE}}` | enum | Doxygen / JSDoc / Docstring / JavaDoc |
| Naming/style tokens | vari | Da registry coding (namespace, indent, …) |

### 5.4 Persistenza

Tutti i token risolti vanno in **`PROJECT_PARAMETERS.md`** alla root del progetto target. Nessun template istanziato può contenere `{{...}}` irrisolti.

---

## 6. Entry point: `AGENTS.md`

Ogni agente AI deve leggere `AGENTS.md` **prima** di qualsiasi task sostanziale.

### 6.1 Sequenza obbligatoria di avvio

1. Leggere `ai-framework/README.md`
2. Leggere `ai-framework/core/methodology.md`
3. Leggere il workflow pertinente da `ai-framework/workflows/`
4. Leggere il ruolo agente da `ai-framework/agents/`
5. Leggere gli standard applicabili da `ai-framework/standards/`
6. Leggere i template applicabili da `ai-framework/templates/`
7. Leggere `PROJECT_PARAMETERS.md`
8. Produrre un piano di esecuzione conciso **prima** di modificare file

### 6.2 Lifecycle obbligatorio per ogni task

1. Comprendere la richiesta
2. Identificare file impattati
3. Creare o aggiornare requisiti strutturati (`Design/`)
4. Produrre piano task (`TASKS.md` o `PLAN.md`)
5. Implementare incrementalmente (`Code/`)
6. Aggiungere o aggiornare test (`Code/.../test/` e `Test/`)
7. Eseguire check disponibili
8. Produrre validation report (`Test/.../reports/`)
9. Se score < soglia → correggere e ripetere
10. Fermarsi solo quando la Definition of Done è soddisfatta

### 6.3 Quality gate (Definition of Done)

Un task **non** è completato finché:

- i criteri di accettazione dei REQ linkati sono soddisfatti;
- ogni REQ linkato ha **Tipo**, **MoSCoW** e **Priorità** compilati;
- i test richiesti passano;
- la documentazione pubblica è aggiornata (secondo `{{DOC_COMMENT_STYLE}}`);
- il validation score ≥ `{{VALIDATION_THRESHOLD}}` **(obbligatorio da Fase 2 del meta-framework; opzionale in v1 pilota)**;
- i bug noti sono registrati in formato `bug.template.yaml`;
- il report finale spiega cosa è cambiato e perché, nella lingua `{{PROJECT_LANGUAGE}}`;
- non restano blocking issues aperti.

---

## 7. Agenti e orchestrazione

### 7.1 Ruoli agente

File in `ai-framework/agents/` — l'agente **simula** questi ruoli per lavoro non banale:

| Ruolo | File | Responsabilità |
|-------|------|----------------|
| Planner | `planner.md` | Scomposizione task, priorità, rischi |
| Architect | `architect.md` | Coerenza architetturale, ADR |
| Developer | `developer.md` | Implementazione incrementale |
| Tester | `tester.md` | Test case, esecuzione, evidenze |
| Reviewer | `reviewer.md` | Code review strutturata → `REVIEW.md` |
| Validator | `validator.md` | Validation report, scoring |
| Bug Manager | `bug-manager.md` | Bug report, regression |
| Documentation Specialist | `documentation-specialist.md` | Doc API, README, commenti |

### 7.2 Regola orchestrazione

Per task non triviali l'agente **non salta** direttamente all'implementazione.

```text
Requirement intake → analysis → plan → implementation
→ tests → validation → fixes → final report
```

Se la validation fallisce → ritorno alla fase Developer.

### 7.3 Cursor Rules (adattatore primario)

Regole modulari in `.cursor/rules/` — piccole, numerate, con `globs` mirati:

| File | Scopo | alwaysApply |
|------|-------|-------------|
| `00-load-framework.mdc` | Carica AGENTS.md + ai-framework | true |
| `10-project-context.mdc` | Contesto PROJECT_PARAMETERS | true |
| `20-agent-orchestration.mdc` | Ruoli e lifecycle | true |
| `30-requirements-management.mdc` | REQ in Design/ | globs su `Design/**/REQUIREMENTS.md` |
| `40-coding-standards.mdc` | Standard coding | true |
| `50-documentation.mdc` | Doc comments (glob su linguaggio) | globs su estensioni |
| `60-testing.mdc` | Regole test | globs su test/ |
| `70-bug-management.mdc` | Bug in Test/ | globs su `Test/**/bugs/` |
| `80-validation-loop.mdc` | Validation report + rubric | true |
| `90-definition-of-done.mdc` | Quality gate finale | true |

> **Nota:** `50-doxygen.mdc` del documento originale diventa `50-documentation.mdc` generico; Doxygen si applica solo quando `{{DOC_COMMENT_STYLE}} = Doxygen`.

### 7.4 MCP — scheletro `mcp.json`

File: `.cursor/mcp.json` — incluso fin da v1 con placeholder da sostituire quando serve.

```json
{
  "mcpServers": {}
}
```

Placeholder da aggiungere quando serve un server concreto:

```json
{
  "mcpServers": {
    "example-server": {
      "command": "npx",
      "args": ["-y", "@example/mcp-server"],
      "env": {
        "API_KEY": "${env:EXAMPLE_API_KEY}"
      }
    }
  }
}
```

Regola: non committare secret reali; usare variabili d'ambiente o `.env` locale (gitignored).

---

## 8. Template artefatti

### 8.1 Convenzioni ID e posizione

| Artefatto | ID | Posizione primaria | Formato |
|-----------|-----|-------------------|---------|
| Requisito | `REQ-XXXX` | `Design/areas/{{AREA}}/REQUIREMENTS.md` | Markdown |
| Requisito (automazione) | `REQ-XXXX` | export / validazione | YAML |
| Task | `TASK-XXXX` | `Design/areas/{{AREA}}/TASKS.md` o `Code/.../PLAN.md` | YAML inline o MD |
| Decisione | `DEC-XXXX` | `Design/areas/{{AREA}}/decisions/` | Markdown |
| Bug | `BUG-XXXX` | `Test/{{AREA}}/bugs/` | YAML |
| Test case | `TC-XXXX` | `Test/{{AREA}}/test-cases/` | YAML o MD |
| Change request | `CR-XXXX` | `Design/areas/{{AREA}}/REQUIREMENTS.md` | Markdown |
| Review | — | accanto al modulo | `REVIEW.md` |
| Validation report | — | `Test/{{AREA}}/reports/` | JSON |

### 8.2 Requisito — Markdown (formato primario)

Ogni REQ in `REQUIREMENTS.md` include:

- ID stabile (`REQ-XXXX`)
- Titolo, status, priorità, tipo
- Descrizione e business goal
- Acceptance criteria testabili
- Classificazione multidimensionale: **Area**, **Livello**, **Tipo**, **MoSCoW**, **Priorità**
- **Obbligatori (D19):** Tipo, MoSCoW, Priorità — l'agente non accetta REQ incompleti
- Dipendenze, vincoli, out-of-scope, assunzioni, rischi
- Milestone opzionale (da `{{MILESTONE_LIST}}` del progetto)
- Riferimento riga in `Design/_index.md`
- ID **globale** sequenziale (`REQ-0001`, …) — non per-area

### 8.3 Requisito — YAML (formato secondario)

File: `ai-framework/templates/requirement.template.yaml`

```yaml
id: REQ-0000
title: ""
status: draft          # draft | approved | implemented | verified
priority: medium       # low | medium | high | critical
type: functional       # functional | safety | security | performance

description: ""
business_goal: ""

acceptance_criteria:
  - id: AC-001
    description: ""
    testable: true

classification:
  area: "{{AREA_NAME}}"
  level: ""            # Alto Livello | Architetturale | Basso Livello | Implementativo
  type: ""             # REQUIRED: functional | safety | security | performance
  moscow: ""           # REQUIRED: Must | Should | Could | Won't
  priority: ""         # REQUIRED: Alta | Media | Bassa
  milestone: ""        # optional — id from {{MILESTONE_LIST}}

constraints: []
dependencies: []
out_of_scope: []
assumptions: []
risks: []
test_notes: ""

created_by: ai-framework
last_updated: ""
```

> **Regola:** Markdown è la source of truth umana; YAML è derivato o usato per validazione automatica. Non mantenere due versioni divergenti.

### 8.4 Task

File: `ai-framework/templates/task.template.yaml`

```yaml
id: TASK-0001
title: ""
status: todo           # todo | in_progress | done | blocked
priority: medium

area: "{{AREA_NAME}}"
module: "{{MODULE_NAME}}"    # opzionale

linked_requirements:
  - REQ-0001

description: ""
impacted_files: []

implementation_steps:
  - ""

tests_to_add_or_update:
  - ""

validation_checks:
  - ""

definition_of_done:
  - "Requirement coverage verified"
  - "Tests added or updated"
  - "Relevant checks pass"
  - "Documentation updated"
  - "Validation score above threshold"

notes: ""
```

### 8.5 Bug

File: `ai-framework/templates/bug.template.yaml`

```yaml
id: BUG-0001
title: ""
status: open           # open | in_progress | resolved | wont_fix
severity: medium
priority: medium

area: "{{AREA_NAME}}"

environment:
  os: ""
  runtime: ""
  version: ""

description: ""

steps_to_reproduce:
  - ""

expected_result: ""
actual_result: ""
suspected_cause: ""

linked_requirements: []
linked_test_cases: []
impacted_files: []

regression: unknown    # yes | no | unknown
proposed_fix: ""
test_case_required: true
validation_notes: ""
```

### 8.6 Validation report

File: `ai-framework/templates/validation-report.template.json`

```json
{
  "task_id": "",
  "area": "",
  "module": "",
  "linked_requirements": [],
  "overall_score": 0,
  "threshold": 85,
  "passed": false,
  "scores": {
    "requirement_coverage": 0,
    "correctness": 0,
    "maintainability": 0,
    "test_coverage": 0,
    "documentation_quality": 0,
    "error_handling": 0,
    "architectural_consistency": 0,
    "security_privacy_impact": 0,
    "regression_risk": 0
  },
  "blocking_issues": [],
  "non_blocking_issues": [],
  "fix_plan": [],
  "evidence": {
    "tests_run": [],
    "files_reviewed": [],
    "commands_executed": []
  },
  "final_recommendation": ""
}
```

### 8.7 Validation rubric

File: `ai-framework/validators/validation-rubric.yaml`

```yaml
thresholds:
  minimum_pass_score: 85       # override via {{VALIDATION_THRESHOLD}}
  critical_blocker_score_cap: 70

weights:
  requirement_coverage: 20
  correctness: 20
  maintainability: 15
  test_coverage: 15
  documentation_quality: 10
  error_handling: 10
  architectural_consistency: 5
  security_privacy_impact: 3
  regression_risk: 2

blocking_conditions:
  - missing_required_tests
  - failing_tests
  - undocumented_public_api
  - requirement_not_implemented
  - unsafe_data_handling
  - breaking_change_not_declared

scoring_policy:
  100: "complete, tested, documented, minimal risk"
  90: "minor non-blocking improvements possible"
  85: "acceptable for completion"
  70: "requires fixes before completion"
  50: "incomplete implementation"
  0: "not valid or not assessed"
```

---

## 9. Workflow

### 9.1 Feature development

File: `ai-framework/workflows/feature-development.workflow.md`

| Fase | Azione |
|------|--------|
| 1 — Requirement intake | Convertire richiesta in REQ (`Design/`); documentare assunzioni |
| 2 — Planning | Task breakdown; link REQ; identificare file e test |
| 3 — Architecture review | Coerenza architetturale; ADR se necessario |
| 4 — Implementation | Incrementale in `Code/`; aggiornare doc |
| 5 — Testing | Test unitari + integrazione in `Test/` |
| 6 — Validation | Validation report JSON; score con rubric |
| 7 — Fix loop | Se score < soglia: fix plan → correzioni → re-test → nuovo report |
| 8 — Final report | Summary, REQ coperti, test, score, limiti noti |

### 9.2 Bug fix

File: `ai-framework/workflows/bug-fix.workflow.md`

Bug intake → reproduction → root cause → fix minimale → validation → report.

### 9.3 Altri workflow

| Workflow | File |
|----------|------|
| Refactoring | `refactor.workflow.md` |
| Release check | `release-check.workflow.md` |
| Documentation | `documentation.workflow.md` |

### 9.4 Flusso operativo post-setup

**Design:**

```text
_RAW/
  ↓  #meeting-digest
Design/meetings/  (o Design/areas/{{AREA}}/meetings/)
  ↓  #req-create
Design/areas/{{AREA}}/REQUIREMENTS.md  (+ riga in _index.md)
  ↓  #req-review
Validazione coerenza REQ ↔ implementazione
  ↓  #decision-create
Design/areas/{{AREA}}/decisions/DEC-XXXX.md
```

**Code:**

```text
#setup-environment
  ↓
Code/{{AREA}}/{{MODULE}}/PLAN.md
  ↓  #new-component
Implementazione in src/
  ↓  #review-code
REVIEW.md
  ↓  #update-plan
Aggiornamento PLAN.md / TASKS.md
```

**Test:**

```text
#test-case-create  →  Test/{{AREA}}/test-cases/TC-XXXX
#bug-create        →  Test/{{AREA}}/bugs/BUG-XXXX
Esecuzione test    →  Test/{{AREA}}/reports/
#validation-report →  validation-report.json
```

---

## 10. Setup di un nuovo progetto

### 10.1 Prerequisiti

Prima del setup, definire almeno: `PROJECT_ID`, `PROJECT_NAME`, `PROJECT_DESCRIPTION`.

Cursor IDE: scaricabile da [cursor.com/downloads](https://cursor.com/downloads). Compatibile con estensioni VS Code.

### 10.2 Fase 1 — `#project-setup` (Design)

```
#project-setup
```

L'agente:

1. Conduce interview (identità, `PROJECT_LANGUAGE`, `CLIENT_NAME`, governance, aree, milestone opzionali da §2.3)
2. Crea/aggiorna `PROJECT_PARAMETERS.md`
3. Crea alberatura `Design/`, `Code/`, `Test/`
4. Genera `Design/_index.md`
5. Crea `Design/areas/{{AREA}}/REQUIREMENTS.md` per ogni area
6. Inizializza `_RAW/`
7. Istanza `AGENTS.md`, `ai-framework/`, `.cursor/rules/`, `.cursor/mcp.json` (scheletro)
8. Istanza `.github/` (adattatore Copilot, pari a Cursor)

**Gate:** nessun `{{...}}` irrisolto in `PROJECT_PARAMETERS.md`.

### 10.3 Fase 2 — `#setup-environment` (Code, per ogni modulo)

```
#setup-environment
```

L'agente:

1. Chiede parametri modulo (area, linguaggio, build, test, repo dedicata, naming)
2. Append sezione modulo in `PROJECT_PARAMETERS.md`
3. Crea `Code/{{AREA}}/{{MODULE}}/`
4. Genera istruzioni/specs AI per-modulo
5. Scaffold `src/`, `PLAN.md`, `README.md` (se repo locale)

### 10.4 Fase 3 — Primo ciclo operativo

Scegliere un task piccolo (un test, un REQ, documentare una funzione) e attraversare l'intero lifecycle fino al validation report.

### 10.5 Checklist pre-lancio

- [ ] `PROJECT_PARAMETERS.md` completo
- [ ] `#project-setup` eseguito
- [ ] Almeno un modulo con `#setup-environment`
- [ ] Alberatura Design / Code / Test verificata
- [ ] `AGENTS.md` e `.cursor/rules/` attivi
- [ ] Repository Git inizializzata; remote testato
- [ ] Convenzione ID artefatti comunicata

---

## 11. Prompt catalog

### 11.1 Design module

| Prompt | Scopo |
|--------|-------|
| `#project-setup` | Setup iniziale progetto + struttura Design |
| `#meeting-digest` | Struttura minuta da materiale grezzo |
| `#req-create` | Estrae REQ da note/meeting |
| `#req-review` | Verifica coerenza REQ vs implementazione |
| `#decision-create` | Crea DEC-XXXX |
| `#task-create` | Crea TASK-XXXX collegato a REQ |

### 11.2 Coding module

| Prompt | Scopo |
|--------|-------|
| `#setup-environment` | Setup modulo + config AI per-modulo |
| `#new-module` | Genera PLAN.md per nuovo modulo |
| `#new-component` | Scaffold classe/componente |
| `#review-code` | Review strutturata → REVIEW.md |
| `#update-plan` | Aggiorna PLAN.md / TASKS.md |
| `#generate-docs` | Genera doc comments |

### 11.3 Test module

| Prompt | Scopo |
|--------|-------|
| `#test-case-create` | Crea TC-XXXX |
| `#bug-create` | Crea BUG-XXXX |
| `#validation-report` | Genera validation report JSON |

### 11.4 Prompt meta-framework (costruzione del framework stesso)

Per generare il framework in un repo vuoto:

```text
Create the AI Development Framework for this repository.

Read _RAW/ai-framework-guide_1.0.md as the authoritative specification.

Create:
- AGENTS.md
- ai-framework/ (core, modules, agents, templates, workflows, standards, validators)
- adapters/cursor/ (.mdc rules)
- adapters/copilot/ (optional .github template)

Follow all adopted decisions in section 2 of the guide.
Propose the final structure and assumptions before creating files.
Then create the files.
```

---

## 12. Task management (file-based)

I task **non** vanno su Atlassian o altri tool proprietari di default.

- **Backlog:** `Design/areas/{{AREA}}/TASKS.md` o sezioni in `PLAN.md`
- **Formato:** `task.template.yaml` (inline o file dedicati)
- **Tracciabilità:** ogni TASK linkato ad almeno un REQ

### 12.1 Integrazione futura (opzionale)

Adattatore in `adapters/task-sync/` per tool con API mature e open source:

- Plane, Taiga, GitLab Issues, GitHub Issues

L'adattatore **non modifica** la struttura Design/Code/Test; sincronizza solo artefatti esistenti.

---

## 13. Optional modules

Moduli plug-in in `ai-framework/modules/optional/` — attivati via parametri (`depends_on`).

| Modulo | Parametro | Contenuto |
|--------|-----------|-----------|
| C++ tooling | `LANGUAGE in [C, C++]` | Doxygen, `.clang-format` template, include guards |
| Python / Web | `LANGUAGE in [Python, TypeScript, JavaScript]` | gui-theming (Qt), frontend style, npm tooling |
| *(futuro)* | — | altri stack on demand |

Ogni optional module è self-contained (`instructions/`, `specs/`, `prompts/`).

---

## 14. Aree di intervento — esempi

Le aree **non sono prefissate**. L'utente le definisce al `#project-setup`.

| AREA_NAME | Design | Code | Test |
|-----------|--------|------|------|
| `system` | REQ cross-cutting | — | strategia sistema |
| `backend` | REQ API | moduli servizio | integration |
| `frontend` | REQ UX/UI | app UI | E2E |
| `embedded` | REQ firmware | BSP, HAL | HIL |
| `infra` | REQ deploy | IaC, CI | smoke |

> Un'area può esistere solo in Design (es. `system`) senza moduli Code — è valido.

---

## 15. Piano di implementazione del meta-framework

Ordine consigliato per costruire **questo** repository:

### Fase 0 — Fondamenta (priorità immediata)

- [ ] Creare struttura `ai-framework/` come da §3.1
- [ ] Scrivere `core/methodology.md`, `lifecycle.md`, `quality-gates.md`
- [ ] Migrare `Orig_Data/02.Coding` → `ai-framework/modules/coding/`
- [ ] Migrare `Orig_Data/01.Design` → `ai-framework/modules/design/`

### Fase 1 — Core operativo

- [ ] Unificare `parameters.yml` (progetto + area + modulo + `PROJECT_LANGUAGE`, `CLIENT_NAME`, `MILESTONE_LIST`)
- [ ] Creare template task, bug, validation (§8)
- [ ] Creare `validators/validation-rubric.yaml` (gate disattivato di default in v1)
- [ ] Creare agent role files (§7.1)
- [ ] Creare workflow (§9)
- [ ] Catalogo milestone §2.3 come `ai-framework/templates/milestone-catalog.md`

### Fase 2 — Adattatori IDE (Cursor + Copilot)

- [ ] Template `AGENTS.md`
- [ ] Generare `.mdc` rules in `adapters/cursor/`
- [ ] Scheletro `adapters/cursor/mcp.json` con placeholder
- [ ] Adattatore Copilot in `adapters/copilot/` (parità funzionale con Cursor)
- [ ] Aggiornare `#setup-environment` per istanziare `.cursor/`, `.github/`, `AGENTS.md`
- [ ] Optional modules: C++ tooling + Python/Web (da Orig_Data)

### Fase 3 — Modulo Test

- [ ] Creare `ai-framework/modules/test/`
- [ ] Prompt `#test-case-create`, `#bug-create`, `#validation-report`
- [ ] Workflow end-to-end REQ → PLAN → TASK → VALIDATION

### Fase 4 — Progetto pilota (repo separato)

- [ ] Scegliere tipologia: libreria C++, web, firmware o mix backend+frontend
- [ ] Applicare framework al repo pilota
- [ ] **Attivare validation gate obbligatorio** (Fase 2 del lifecycle qualità)
- [ ] Raffinare soglie, prompt, optional modules
- [ ] Documentare lezioni apprese in `docs/`

### Fase 5 — Automazione (evoluzione)

- [ ] Script validazione schema YAML/JSON
- [ ] Lint markdownlint su artefatti
- [ ] Popolare `mcp.json` con server concreti (se necessario)
- [ ] Adattatore task-sync GitHub Issues (se necessario)

---

## 16. Best practice

### Fare

- Regole corte e modulari
- Template YAML/JSON per artefatti machine-readable
- Logica comune in `ai-framework/`; adattatori minimali
- Versionare tutto in Git
- Report finali obbligatori
- Test obbligatori prima del Done
- Scoring con soglia configurabile
- Separare commit framework da commit applicativi

### Evitare

- Mega-prompt unico
- Regole duplicate o contraddittorie
- Istruzioni vaghe
- Validation solo soggettiva
- Mischiare prompt, template, standard nello stesso file
- Vincoli organizzativi nel core
- Due source of truth per gli stessi REQ

---

## 17. Evoluzione avanzata

Quando il framework è stabile:

```text
AI prompt framework
+ automated validation scripts
+ test suite
+ quality gates
+ agentic workflow
+ optional external adapters (task-sync, MCP)
```

Obiettivo: ridurre la dipendenza dall'obbedienza del modello; aumentare i controlli verificabili.

---

## 18. Glossario

| Termine | Significato |
|---------|-------------|
| **Meta-framework** | Questo repository; prodotto riusabile |
| **Progetto target** | Repository software su cui il framework viene istanziato |
| **Area di intervento** | Dominio logico (backend, embedded, …) che organizza Design/Code/Test |
| **Modulo** | Unità di codice dentro un'area (`Code/{{AREA}}/{{MODULE}}`) |
| **SSOT** | Single Source of Truth — `PROJECT_PARAMETERS.md` |
| **Validation loop** | Ciclo score → fix → re-score fino a soglia |
| **Optional module** | Plug-in attivabile senza modificare il core |
| **Adattatore** | Layer IDE-specifico (Cursor, Copilot) |

---

## 19. Riferimenti incrociati

| Argomento | Sezione |
|-----------|---------|
| Decisioni adottate | §2 |
| Struttura meta-framework | §3.1 |
| Struttura progetto target | §3.2 |
| Parametri | §5 |
| AGENTS.md e DoD | §6 |
| Template completi | §8 |
| Setup operativo | §10 |
| Piano implementazione | §15 |

---

*Questo documento è la specifica autoritativa v1.0 per la progettazione e l'implementazione del meta-framework AI. Ogni modifica sostanziale richiede incremento di versione e aggiornamento esplicito delle decisioni in §2.*
