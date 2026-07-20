# MEETINGS — Cartella Minute di Riunione

Questa cartella contiene le **minute strutturate** delle riunioni del progetto,
prodotte manualmente o tramite il prompt AI `meeting-digest.prompt.md`.

---

## ✅ COSA METTERE QUI (cartella radice)

File `YYYY-MM-DD_<topic>.md` — **una minuta già strutturata** per ogni riunione.

### Convenzione nomi file

```
2026-06-30_sprint-1-planning.md
2026-07-07_technical-autenticazione.md
2026-07-14_sprint-1-review.md
```

- Data `YYYY-MM-DD` all'inizio (ordinamento cronologico automatico)
- Topic in kebab-case, breve e descrittivo
- Sempre `.md`

### Tipi di riunione

| Tipo | Esempio nome file |
|------|------------------|
| Sprint Planning | `YYYY-MM-DD_sprint-N-planning.md` |
| Sprint Review | `YYYY-MM-DD_sprint-N-review.md` |
| Sprint Retrospective | `YYYY-MM-DD_sprint-N-retro.md` |
| Technical | `YYYY-MM-DD_technical-<topic>.md` |
| Allineamento cliente | `YYYY-MM-DD_allineamento-<stakeholder>.md` |

---

## 📥 Cartella `_raw/` — Zona di Raccolta Materiale Grezzo

> **Regola d'oro: meglio un appunto grezzo in `_raw/` che una decisione persa.**

In `_raw/` puoi mettere **qualsiasi cosa non strutturata**:
trascrizioni automatiche (Teams/Zoom/AI), appunti veloci, bozze, copia-incolla da chat.

Vedi [`_raw/README.md`](_raw/README.md) per dettagli.

### Flusso completo

```
Riunione / Trascrizione / Appunti
           ↓
   _raw/<data>_<topic>_raw.txt   ← BUTTA QUI IL GREZZO
           ↓
   #meeting-digest               ← AI struttura la minuta + identifica REQ candidati
           ↓
   YYYY-MM-DD_<topic>.md         ← Minuta strutturata (questa cartella)
           ↓
   Ci sono REQ candidati?
   ├─ Sì → #req-create → REQ-XXXX in AREA_*.md + riga in _index.md
   └─ No → fine
```

---

## ❌ COSA NON METTERE QUI (in questa cartella radice)

| NON mettere | Dove va |
|-------------|---------|
| Trascrizioni grezze, appunti, bozze | `_raw/` |
| Requisiti approvati | `DOC_WIP/REQUIREMENTS/` |
| Documentazione tecnica stabile | `DOC_IN/` |
| File audio/video | Storage esterno |

---

## Nota per Copilot AI

1. Consulta prima `DOC_WIP/REQUIREMENTS/_index.md` per requisiti normativi.
2. Le minute sono **fonte informativa** (contesto, motivazioni, partecipanti),
   non normativa.
3. Se in una minuta trovi una decisione senza REQ corrispondente, segnalalo
   e suggerisci di creare il REQ con `req-create.prompt.md`.
