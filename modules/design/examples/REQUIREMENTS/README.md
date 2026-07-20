# REQUIREMENTS — Cartella Requisiti del Progetto

Questa cartella contiene tutti i **requisiti strutturati** del progetto,
organizzati per **Area Tematica** in file `AREA_*.md`.

---

## ✅ COSA METTERE QUI

- File `AREA_<nome-kebab-case>.md` — **un file per Area**, con tutti i REQ di quell'area
- Il file `_index.md` — indice master multidimensionale (aggiornato ad ogni nuovo REQ)

### File AREA presenti

> **Aggiorna questa tabella ogni volta che aggiungi un nuovo file AREA.**

| File | Area tematica | REQ contenuti |
|------|---------------|---------------|
| `AREA_example.md` | Esempio (da sostituire) | REQ-0001 |

### Convenzione nomi file AREA

```
AREA_autenticazione.md
AREA_export-dati.md
AREA_api-rest.md
AREA_ui-ux.md
AREA_architettura.md
```

- Prefisso `AREA_` obbligatorio
- Nome in kebab-case (minuscolo, parole separate da `-`)
- Sempre `.md`

### Struttura interna di ogni file AREA

Ogni REQ dentro il file AREA usa:
1. Un anchor HTML `<a id="req-XXXX"></a>` per i link diretti dall'indice
2. Un header `## REQ-XXXX — Titolo` come sezione
3. Una **tabella metadati** con: Area, Livello, Tipo, MoSCoW, Priorità, Stato
4. Le sezioni: Contesto, Requisito, Criteri di Accettazione, Conseguenze, Note verifica

> Per creare un nuovo AREA file usa il template:
> `.github/templates/req-area-file.template.md`

---

## ❌ COSA NON METTERE QUI

| NON mettere | Dove va invece |
|-------------|----------------|
| Note grezze, trascrizioni, appunti | `DOC_WIP/MEETINGS/_raw/` |
| Minute di riunione | `DOC_WIP/MEETINGS/` |
| Documentazione tecnica stabile | `DOC_IN/` |
| File `REQ-XXXX_singolo.md` individuali | ❌ Non supportati — usare i file AREA |
| Codice sorgente | Repository del codice |

---

## Classificazione REQ — Valori ammessi

| Dimensione | Valori |
|------------|--------|
| **Livello** | `Alto Livello` · `Architetturale` · `Basso Livello` · `Implementativo` |
| **Tipo** | `Funzionale` · `Safety` · `Security` · `Prestazionale` |
| **MoSCoW** | `Must` · `Should` · `Could` · `Won't` |
| **Priorità** | `Alta` · `Media` · `Bassa` + Sprint target opzionale |
| **Stato** | `❓ Proposto` · `🔄 In Review` · `✅ Approvato` · `❌ Deprecato` · `🔁 Sostituito` |

---

## Regole di priorità (per Copilot AI)

1. REQ con stato `✅ Approvato` sono **normativi** — hanno priorità su DOC_IN per lo stesso argomento.
2. REQ con stato `❓ Proposto` sono **informativi** — non ancora confermati dallo stakeholder.
3. In caso di conflitto tra due REQ approvati, prevale il REQ con **numero più alto**.
4. REQ `❌ Deprecato` o `🔁 Sostituito` non sono normativi.

---

## Ciclo di vita di un REQ

```
Note grezze in _raw/
      ↓
req-create.prompt.md  ←  AI estrae e classifica
      ↓
REQ in AREA_*.md con stato ❓ Proposto
      ↓
Review interna del team
      ↓
🔄 In Review  →  Presentazione allo stakeholder
      ↓
✅ Approvato  →  aggiorna _index.md
      ↓
Implementazione  →  req-review.prompt.md per verifica copertura
```

---

## Come aggiornare `_index.md`

Per ogni nuovo REQ aggiunto o il cui stato cambia:

```markdown
| REQ-XXXX | YYYY-MM-DD | Titolo | Area | Livello | Tipo | MoSCoW | Prio | ❓ | [→](AREA_nome.md#req-xxxx) |
```
