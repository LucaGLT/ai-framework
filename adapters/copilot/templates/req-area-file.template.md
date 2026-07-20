# Template — Nuovo File AREA per Requisiti

> **Come usare questo template:**
> 1. Copia questo file in `DOC_WIP/REQUIREMENTS/`
> 2. Rinominalo `AREA_<nome-kebab-case>.md`  
>    es. `AREA_autenticazione.md`, `AREA_export-dati.md`, `AREA_api-rest.md`
> 3. Sostituisci `[NOME_AREA]` e `[DESCRIZIONE_AREA]`
> 4. Elimina questo blocco di istruzioni
> 5. Aggiungi l'area alla tabella in `_index.md` e in `REQUIREMENTS/README.md`

---

# Area: [NOME_AREA] — Requisiti

> Questo file raccoglie tutti i requisiti relativi all'area **[NOME_AREA]**.
> [DESCRIZIONE_AREA: cosa comprende questa area, es. "Gestione autenticazione utenti,
> sessioni, permessi e ruoli."]
>
> Per aggiungere un nuovo REQ in quest'area:
> - Usa il prompt `.github/prompts/req-create.prompt.md`
> - Oppure copia il blocco template qui sotto e compilalo manualmente
> - Aggiungi l'anchor `<a id="req-XXXX"></a>` prima di ogni `## REQ-XXXX`
> - Aggiorna la riga in `DOC_WIP/REQUIREMENTS/_index.md`

---

<!-- ═══════════════════════════════════════════════════════════════════
     TEMPLATE REQ — copia questo blocco per ogni nuovo requisito
     ═══════════════════════════════════════════════════════════════════ -->

<a id="req-XXXX"></a>
## REQ-XXXX — [Titolo breve, max 8 parole]

| Campo | Valore |
|-------|--------|
| **Data** | YYYY-MM-DD |
| **Stato** | ❓ Proposto — Da verificare con cliente |
| **Area** | [NOME_AREA] |
| **Livello** | `Alto Livello` · `Architetturale` · `Basso Livello` · `Implementativo` |
| **Tipo** | `Funzionale` · `Safety` · `Security` · `Prestazionale` |
| **MoSCoW** | `Must` · `Should` · `Could` · `Won't` |
| **Priorità** | `Alta` · `Media` · `Bassa` — Sprint: [n o "da definire"] |
| **Autori** | [nomi/ruoli] |
| **Sorgente** | [path file grezzo o descrizione fonte] |
| **Verificato con cliente** | No |

### Contesto

[Situazione attuale, problema o necessità che ha generato questo requisito.
Spiega il "perché" — cosa succede senza questo requisito.]

### Requisito

**[Enunciato del requisito in forma imperativa, chiara e verificabile.]**

[Dettagli aggiuntivi, esempi, casi limite se necessario.]

### Criteri di Accettazione

- [ ] [Condizione verificabile e misurabile 1]
- [ ] [Condizione verificabile e misurabile 2]
- [ ] [Condizione verificabile e misurabile 3]

### Conseguenze / Vincoli

- **Impatto su**: [moduli, componenti, file coinvolti]
- **Dipende da**: [REQ-YYYY, componente X, ecc. — o "nessuna dipendenza"]
- **Richiesto da**: [REQ-ZZZZ che dipende da questo — o "nessuno"]
- **Rischi / Trade-off**: [conseguenze negative o trade-off noti]

### Note di verifica con cliente

> ⚠️ **Da verificare con [STAKEHOLDER]**:
> - [Domanda specifica 1]
> - [Domanda specifica 2]

---

<!-- fine template REQ — aggiungi altri REQ qui sotto seguendo lo stesso schema -->
