# _raw/ — Zona di Raccolta Materiale Grezzo

Qui puoi buttare **qualsiasi cosa**. Non serve formattazione, struttura o ordine.
L'AI si occupa di trasformare il grezzo in documentazione strutturata.

---

## ✅ COSA METTERE QUI

| Tipo di materiale | Esempio nome file |
|-------------------|------------------|
| Trascrizione automatica (Teams, Zoom, AI) | `2026-06-30_sprint1-review_transcript.txt` |
| Appunti presi a mano | `2026-06-30_appunti.txt` |
| Bozza di minuta incompleta | `2026-06-30_bozza.md` |
| Copia-incolla da chat Teams/Slack | `2026-07-01_chat-decisions.txt` |
| Email con decisioni | `2026-07-02_email-architettura.txt` |
| Qualsiasi testo non strutturato | qualunque nome va bene |

**Naming consigliato** (non obbligatorio):
```
YYYY-MM-DD_<topic>_raw.<ext>
```

---

## ❌ COSA NON METTERE QUI

- Minute già strutturate → cartella padre `DOC_WIP/MEETINGS/`
- Requisiti approvati → `DOC_WIP/REQUIREMENTS/`
- File audio o video → storage esterno

---

## Come elaborare il materiale grezzo

### In Copilot Chat

```
[allega il file grezzo]
Usa il prompt #meeting-digest su questo file.
```

Copilot produce:
- Minuta strutturata → salva in `DOC_WIP/MEETINGS/YYYY-MM-DD_<topic>.md`
- Lista REQ candidati → elabora con `#req-create`

### Se non passi input

Il prompt `meeting-digest` elenca automaticamente i file presenti in questa cartella
e ti chiede quale elaborare.

---

> I file in `_raw/` restano come **archivio storico**.
> Non vengono cancellati automaticamente dopo l'elaborazione.
>
> **Regola d'oro: meglio un appunto grezzo qui che una decisione persa.**
