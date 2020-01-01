Il dataset [nascar](../dati/nascar.sas7bdat) contiene l’esito di 5 gare automobilistiche. Le variabili sono:

*  ID: numero identificativo del pilota
*  NOME
*  COGNOME
*  AUTO: marca dell’auto utilizzata
*  SPONSOR
*  GIRI1-GIRI5: numero di giri completati
*  POS1-POS5: posizione finale
*  PART1-PART5: posizione iniziale
*  PUNTI1-PUNTI5: numero di punti base ottenuti al termine della gara
*  BONUS1-BONUS5: numero di punti bonus ottenuti al termine della gara
*  STATUS1-STATUS5: è uguale a `“Running”` se il pilota ha terminato la gara, altrimenti riporta la causa del ritiro.
*  PREMIO1-PREMIO5: somma di denaro vinta al termine della gara.

Notare che le variabili relative alla gara (GIRI, POSTO, PUNTI, BONUS, STATUS, PREMIO) hanno valore mancante se il pilota non ha partecipato alla gara.

1.  Per ogni pilota, calcolare i punti totali (intesi come somma di punti e bonus) ottenuti.
2.  Per ogni pilota calcolare il numero medio (e deviazione standard) di punti totali ottenuti per ogni gara a cui ha partecipato.
3.  Come il punto precedente, ma solo relativamente alle gare completate.
4.  Per ogni pilota calcolare la somma totale di premi vinti, di giri percorsi e di punti base ottenuti.
