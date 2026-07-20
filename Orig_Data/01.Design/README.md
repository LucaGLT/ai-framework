# Portable .github Kit — Requirements Management per AI

Kit riutilizzabile per qualunque progetto del team.
Implementa un sistema di gestione requisiti basato su file Markdown, navigabile da GitHub Copilot
come se fosse un RAG (Retrieval-Augmented Generation) locale.

---

## Contenuto del kit

```
Portable_.github_for_requirements/
│
├── README.md                                  ← questo file
│
├── .github/
│   ├── copilot-instructions.md                ← system prompt globale (DA PERSONALIZZARE)
│   ├── prompts/
│   │   ├── req-create.prompt.md               ← estrae REQ da note grezze
│   │   ├── meeting-digest.prompt.md           ← struttura una minuta di riunione
│   │   └── req-review.prompt.md               ← verifica coerenza REQ vs implementazione
│   └── templates/
│       └── req-area-file.template.md          ← template per nuovo file AREA
│
└── DOC_WIP/
    ├── REQUIREMENTS/
    │   ├── README.md                          ← regole della cartella
    │   ├── _index.md                          ← indice master multidimensionale
    │   └── AREA_example.md                    ← esempio con un REQ campione
    └── MEETINGS/
        ├── README.md                          ← regole della cartella
        ├── _template.md                       ← template minuta strutturata
        └── _raw/
            └── README.md                      ← zona raccolta materiale grezzo
```

---

## Come installare su un nuovo progetto

### Passo 1 — Copia i file

Copia l'intera struttura nella root del tuo workspace:

```
cp -r Portable_.github_for_requirements/.github         ./.github
cp -r Portable_.github_for_requirements/DOC_WIP         ./DOC_WIP
```

### Passo 2 — Avvia il wizard di setup (una volta sola)

In Copilot Chat, scrivi:
```
#project-setup
```
oppure usa il tasto 📎 Attach → Prompt → `project-setup`.

Il wizard fa **8 domande guidate** e genera automaticamente:

- `.github/copilot-instructions.md` compilato con i dati del tuo progetto
- La lista dei file `AREA_*.md` da creare
- Le tabelle da aggiornare in `README.md` e `_index.md`
- Una checklist di completamento

> Il wizard si usa **una volta sola per progetto**. Dopo, `copilot-instructions.md`
> è compilato e Copilot conosce il contesto del progetto ad ogni sessione.

---

## Flusso operativo

```
Note / Trascrizioni grezze
         ↓
   _raw/ (butta qui tutto)
         ↓
   #meeting-digest  ←  Copilot struttura la minuta
         ↓
   MEETINGS/YYYY-MM-DD_<topic>.md
         ↓
   Ci sono requisiti?
   ├─ Sì → #req-create → REQ-XXXX in AREA_<nome>.md + riga in _index.md
   └─ No → fine
         ↓
   Review cliente → stato ✅ Approvato in _index.md
         ↓
   #req-review  ←  Copilot verifica coerenza con implementazione
```

---

## Classificazione multidimensionale dei REQ

Ogni requisito porta 5 dimensioni di classificazione come metadati:

| Dimensione | Valori ammessi |
|------------|----------------|
| **Area** | [definita per progetto] — es. Autenticazione, Export, API |
| **Livello** | `Alto Livello` · `Architetturale` · `Basso Livello` · `Implementativo` |
| **Tipo** | `Funzionale` · `Safety` · `Security` · `Prestazionale` |
| **MoSCoW** | `Must` · `Should` · `Could` · `Won't` |
| **Priorità** | `Alta` · `Media` · `Bassa` + Sprint target opzionale |

Il file `_index.md` aggrega tutte queste dimensioni in una tabella filtrabile da Copilot.

---

## Come usare i prompt in Copilot Chat

| Prompt | Quando usarlo | Come attivarlo |
|--------|---------------|----------------|
| `#project-setup` | **Una volta sola**: configura il kit per il progetto | Primo avvio su nuovo repo |
| `#req-create` | Estrai REQ da note grezze o minuta | Dopo ogni riunione con decisioni |
| `#meeting-digest` | Struttura una trascrizione grezza | Appena hai materiale in `_raw/` |
| `#req-review` | Verifica coerenza REQ vs implementazione | Fine sprint, code review |

---

## Adattamento al tuo standard

Il kit è volutamente **neutro rispetto al dominio**. Le uniche parti da adattare sono:

- `copilot-instructions.md` — contesto progetto
- I nomi delle `AREA_` — uno per feature/modulo del tuo progetto
- Le "Regole dominio" in `copilot-instructions.md` — vincoli tecnici specifici

Tutto il resto (prompt, struttura indice, template REQ, flusso _raw) funziona
**senza modifiche** su qualunque progetto software.
