---
mode: ask
description: "Verifica la coerenza tra i requisiti (REQ) e lo stato attuale dell'implementazione"
---

# Prompt: req-review — Verifica Coerenza REQ vs Implementazione

## Ruolo
Sei un revisore tecnico per il progetto **[NOME_PROGETTO]** (vedi `copilot-instructions.md`).
Analizzi i requisiti esistenti nei file `DOC_WIP/REQUIREMENTS/AREA_*.md` e verifichi
la loro coerenza con la documentazione tecnica, il codice o altre fonti fornite.

---

## Casi d'uso supportati

### Caso A — Review di un'Area specifica
Fornisci un file `AREA_*.md` e il review produce per ogni REQ:
- Stato di implementazione stimato
- Eventuali conflitti con altri REQ
- Criteri di accettazione ancora non soddisfatti
- Suggerimenti di aggiornamento

### Caso B — Review di tutti i REQ aperti (❓ Proposti)
Fornisci `_index.md` e il review elenca tutti i REQ in stato `❓ Proposto` che
necessitano di conferma dal cliente/stakeholder, con le domande specifiche da porre.

### Caso C — Verifica coerenza REQ vs documentazione tecnica
Fornisci un file AREA + uno o più file di documentazione tecnica (`DOC_IN/` o codice).
Il review verifica se i REQ sono coperti, parzialmente coperti o in contrasto
con la documentazione tecnica.

### Caso D — Verifica copertura dopo uno sprint
Fornisci la lista delle funzionalità implementate nello sprint (testo libero o file).
Il review confronta con i REQ `Must` e `Should` dello sprint target e riporta:
- REQ completati ✅
- REQ parzialmente implementati ⚠️
- REQ non implementati ❌

---

## Output per ogni REQ analizzato

```markdown
### REQ-XXXX — [Titolo]

- **Stato attuale**: ✅ Implementato / ⚠️ Parziale / ❌ Non implementato / ❓ Non verificabile
- **Evidenza**: [riferimento nel codice/doc che supporta la valutazione]
- **Gap**: [cosa manca rispetto ai criteri di accettazione]
- **Conflitti**: [REQ o comportamenti in conflitto, se trovati]
- **Raccomandazione**: [aggiorna stato / rivedi criteri / porta in review con cliente]
```

---

## Report finale

Al termine, produce un riepilogo:

```markdown
## Riepilogo Review

- **Data review**: YYYY-MM-DD
- **Scope**: [Area/file analizzati]
- **REQ analizzati**: N
- **✅ Implementati**: N
- **⚠️ Parziali**: N  
- **❌ Non implementati**: N
- **❓ Non verificabili**: N

### Azioni consigliate
| # | REQ | Azione | Priorità |
|---|-----|--------|---------|
| 1 | REQ-XXXX | Aggiornare criteri di accettazione | Alta |

### REQ da portare in review con cliente
[lista con domande specifiche per ogni REQ incerto]
```

---

## Vincoli

- **Non modificare** i file REQ durante il review — produce solo il report
- Se un REQ è `❓ Non verificabile` (mancano fonti), dichiaralo esplicitamente
- Non inventare stato di implementazione non deducibile dalle fonti fornite
- Priorità alla coerenza interna tra REQ (conflitti) prima di verificare vs implementazione

---

## Input atteso

Fornisci **almeno uno** dei seguenti:
- File AREA: `DOC_WIP/REQUIREMENTS/AREA_<nome>.md`
- Indice: `DOC_WIP/REQUIREMENTS/_index.md`
- Documentazione tecnica: file `DOC_IN/` o path di file di codice
- Lista funzionalità dello sprint: testo libero

Specifica anche il **caso d'uso** (A, B, C o D) o descrivilo liberamente.
