# Indice REQ — [NOME_PROGETTO] Requirements Log

> Indice master multidimensionale di tutti i requisiti del progetto.
> **Aggiorna questa tabella** ad ogni nuovo REQ aggiunto o ad ogni cambio di stato.
> GitHub Copilot usa questo file come punto di ingresso per la ricerca dei requisiti.
>
> Per filtrare: chiedi a Copilot es. *"elenca tutti i REQ Must di tipo Funzionale non approvati"*

---

## Legenda stati

| Simbolo | Significato |
|---------|-------------|
| ❓ | Proposto — non ancora verificato con cliente |
| 🔄 | In Review — in attesa di conferma |
| ✅ | Approvato — normativo |
| ❌ | Deprecato — non più valido |
| 🔁 | Sostituito (vedi Note) |

---

## File AREA disponibili

| File | Area | N. REQ |
|------|------|:------:|
| `AREA_example.md` | Esempio | 1 |

---

## Registro REQ

| REQ | Data | Titolo | Area | Livello | Tipo | MoSCoW | Priorità | Stato | Note | Link |
|-----|------|--------|------|---------|------|--------|---------|-------|------|------|
| REQ-0001 | 2026-06-30 | Esempio: sistema deve fare X | Esempio | Alto Livello | Funzionale | Must | Alta | ❓ | Esempio dimostrativo | [→](AREA_example.md#req-0001) |

---

## Come aggiungere un REQ all'indice

```markdown
| REQ-XXXX | YYYY-MM-DD | Titolo breve | Area | Livello | Tipo | MoSCoW | Alta/Media/Bassa | ❓ | Note | [→](AREA_nome.md#req-xxxx) |
```

---

## Query utili per Copilot

Esempi di domande che puoi fare a Copilot allegando questo file:

- *"Elenca tutti i REQ Must non ancora approvati"*
- *"Quali REQ di tipo Security esistono?"*
- *"Mostrami tutti i REQ ad Alta priorità per lo Sprint 3"*
- *"Ci sono REQ di livello Implementativo in area Autenticazione?"*
- *"Quali REQ dipendono da REQ-0005?"* *(richiede di allegare anche i file AREA)*

---

*Ultimo aggiornamento: 2026-06-30 — indice inizializzato con file di esempio*
