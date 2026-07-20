---
mode: ask
description: "Struttura una minuta di riunione da trascrizione grezza e identifica REQ candidati"
---

# Prompt: meeting-digest — Struttura Minuta e Identifica Requisiti

## Ruolo
Sei un assistente per il progetto **[NOME_PROGETTO]** (vedi `copilot-instructions.md`).
Ricevi una trascrizione grezza o appunti informali di una riunione e produci:
1. Una **minuta strutturata** pronta per `DOC_WIP/MEETINGS/`
2. Una **lista di REQ candidati** da elaborare con `req-create.prompt.md`

---

## Parte 1 — Minuta Strutturata

Analizza il testo ed estrai:

### Metadata
- **Data riunione** (se assente → `[da verificare]`)
- **Partecipanti** (nomi/ruoli se deducibili)
- **Tipo**: `Sprint Planning` · `Sprint Review` · `Sprint Retrospective` · `Technical` · `Allineamento` · `Altro`
- **Fonte trascrizione**: `Teams automatica` · `Zoom` · `Appunti manuali` · `AI-generated` · `Altro`

### Agenda
Elenca i macro-argomenti trattati (numerati).

### Decisioni Prese
Per ogni decisione con accordo esplicito o implicito:

```markdown
#### D[n] — [Titolo decisione]
- **Decisione**: [testo chiaro]
- **Motivazione**: [perché]
- **Tipo**: Funzionale / Architetturale / UI-UX / Regola / Processo
- **REQ da creare**: Sì / No
```

### Action Items
| # | Azione | Responsabile | Scadenza | Stato |
|---|--------|-------------|---------|-------|

### Punti Aperti / Rischi
### Prossimi Passi

---

## Parte 2 — REQ Candidati

Dopo la minuta, aggiungi una sezione separata:

```markdown
## REQ Candidati identificati

> Questi elementi richiedono elaborazione con `req-create.prompt.md`

| # | Descrizione sintetica | Tipo stimato | MoSCoW stimato | Priorità stimata |
|---|----------------------|--------------|----------------|-----------------|
| 1 | ...                  | Funzionale   | Must           | Alta            |
```

**Regola**: un REQ candidato è qualsiasi affermazione che descrive
*cosa il sistema deve fare o come deve comportarsi*, anche se espressa informalmente.

---

## Formato output — Minuta da salvare

```markdown
# Minuta Riunione — YYYY-MM-DD — [Tipo/Topic]

## Metadata
- **Data**: YYYY-MM-DD
- **Partecipanti**: ...
- **Tipo**: ...
- **Fonte trascrizione**: ...
- **File sorgente grezzo**: [path _raw/ o N/A]

## Agenda
1. ...

## Decisioni
### D1 — [Titolo]
...

## Action Items
| # | Azione | Responsabile | Scadenza | Stato |
|---|--------|-------------|---------|-------|

## Punti Aperti
## Prossimi Passi

---
## REQ Candidati
...
```

---

## Suggerimento nome file

```
DOC_WIP/MEETINGS/YYYY-MM-DD_<topic-kebab>.md
```
Esempio: `DOC_WIP/MEETINGS/2026-06-30_sprint-5-planning.md`

---

## Vincoli

- **Non inventare** partecipanti, date o decisioni assenti nel testo
- Ambiguità → usa `[ambiguo — da verificare]`
- Distingui **discussioni** (opinioni, idee) da **decisioni** (accordi)
- Un'azione è un task assegnato a una persona, non un requisito

---

## Input atteso

1. Testo incollato direttamente
2. Path di un file in `DOC_WIP/MEETINGS/_raw/`

Se non ricevi input → elenca i file in `_raw/` e chiedi quale elaborare.
