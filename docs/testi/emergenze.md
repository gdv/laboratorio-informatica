---
layout: page
title: Emergenze
---

Il file [FEMA.csv](../dati/FEMA.csv) contiene i dati relativi ad alcuni interventi eseguiti in seguito ad alcune emergenze negli Stati Uniti. I nomi di variabili sono contenuti nella prima riga del file.

1.    Leggere i dati in ingresso e memorizzarli in un data set SAS permanente.
1.    Salvare, in un dataset temporaneo, solo le prime 3 variabili del data set letto. Stampare il dataset originale visualizzando la data nel formato europeo (prima il giorno e dopo il mese) e 0 o 1 a seconda che il proponente sia nel campo dell’istruzione o meno.
1.    Calcolare media, massimo e minimo della variabile Federal Share Obligated stratificata per County.
1.    Ripetere il punto precedente solo sulle osservazioni dell’anno 2008.
1.    Creare un nuovo dataset temporaneo contenente solo le osservazioni relative allo Stato del Texas. Nel nuovo dataset creare una nuova variabile StanziamentoMedio che contiene il rapporto fra i fondi stanziati e il numero di progetti.
1.    Determinare quale stato ha ricevuto la quantità maggiore di fondi totali (quindi bisogna determinare per ogni stato il totale dei fondi ricevuti).
1.    Determinare come i fondi siano stati ripartiti, sia in valore assoluto che in percentuale, rispetto allo stato e al fatto che il richiedente sia nel campo dell’istruzione (Education Applicant).
1.    Creare un nuovo data set con i risultati ottenuti al punto precedente.
1.    Leggere il file di dati [FEMA2.txt](../dati/FEMA2.txt) contenente, per ogni tipologia di emergenza, un valore di severità associato. 
1.    Fondere il nuovo dataset con quello originale.
