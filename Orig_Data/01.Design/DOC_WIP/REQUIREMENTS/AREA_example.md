# Area: Esempio — Requisiti

> **Questo è un file di esempio dimostrativo.**
> Mostra come compilare un file AREA con un REQ reale.
> Sostituiscilo con i tuoi file AREA specifici del progetto.
>
> Per creare un nuovo file AREA usa:
> `.github/templates/req-area-file.template.md`

---

<a id="req-0001"></a>
## REQ-0001 — Il sistema deve notificare l'utente in caso di errore

| Campo | Valore |
|-------|--------|
| **Data** | 2026-06-30 |
| **Stato** | ❓ Proposto — Da verificare con cliente |
| **Area** | Esempio |
| **Livello** | Alto Livello |
| **Tipo** | Funzionale |
| **MoSCoW** | Must |
| **Priorità** | Alta — Sprint: 1 |
| **Autori** | [da definire] |
| **Sorgente** | Esempio dimostrativo |
| **Verificato con cliente** | No |

### Contesto

Gli utenti del sistema devono sempre essere informati quando si verifica un errore
durante l'esecuzione di un'operazione, in modo da poter prendere le azioni correttive
appropriate. Senza notifiche, gli errori silenti compromettono l'affidabilità percepita
del sistema.

### Requisito

**Il sistema deve mostrare un messaggio di errore chiaro e comprensibile all'utente
ogni volta che un'operazione fallisce, indicando la causa e l'azione suggerita.**

Il messaggio deve essere visibile senza che l'utente debba cercarlo attivamente
(es. nella UI principale, non solo nei log).

### Criteri di Accettazione

- [ ] Il messaggio di errore è visibile entro 500ms dal verificarsi dell'errore
- [ ] Il messaggio include: tipo di errore, descrizione leggibile, azione suggerita
- [ ] L'utente può chiudere/ignorare il messaggio con un'azione esplicita
- [ ] Il messaggio non blocca l'intera UI se l'errore non è critico

### Conseguenze / Vincoli

- **Impatto su**: componente di notifiche, MessageBox o sistema toast, tutti i moduli
  che oggi gestiscono errori silenziosamente
- **Dipende da**: nessuna dipendenza
- **Richiesto da**: nessuno
- **Rischi / Trade-off**: troppi messaggi possono diventare rumore — serve una policy
  di filtro per errori minori vs critici

### Note di verifica con cliente

> ⚠️ **Da verificare con [STAKEHOLDER]**:
> - Qual è la soglia tra errore "minore" (solo log) e errore "da notificare" all'utente?
> - Il sistema deve distinguere visivamente tra warning, errore e errore critico?
> - Esiste già un componente UI standard per le notifiche nel progetto?

---

<!-- Aggiungi altri REQ qui sotto seguendo lo stesso schema -->
