Si richiede di scrivere un programma SAS per l’analisi dei dati presenti nel file [japan.zip](../dati/japan.zip) secondo i punti che seguono.

I dati grezzi che si trovano nel file japan.csv riportano alcune rilevazioni relative ai livelli di radioattività misurati in Giappone nel periodo 9/3/2011 – 16/4/2011. Ogni osservazione è relativa ad una misurazione e le variabili sono presenti nella prima riga del file. Il file StationLocations.csv contiene id dati identificativi delle varie stazioni di rilevazione.

1.    Leggere i dati del file in ingresso e memorizzarli in un dataset SAS permanente, tenendo conto che valori negativi di SA e RA corrispondono a dati mancanti.
1.    Calcolare media, massimo e deviazione standard della variabile RA stratificata per STATION_COD.
1.    Determinare come le precipitazioni rilevate (RA) siano distribuite rispetto ai vari giorni di rilevazione.
1.    Creare un nuovo dataset temporaneo contenente solo le osservazioni relative a radiazioni (SA) non mancanti.
1.    Calcolare le precipitazioni medie rilevate in ogni giorno/stazione, emettendo il risultato in un nuovo dataset. Il nuovo dataset dovrebbe quindi avere variabili GIORNO, STAZIONE, RA_MEDIA.
1.    In quale stazione è stato rilevato il minimo valore di RA_MEDIA nel punto precedente?
1.    Costruire un dataset temporaneo che abbia una osservazione per ogni giorno e una variabile per ogni stazione. I dati da memorizzare sono i valori di RA_MEDIA calcolati al punto 5. Le variabili del nuovo dataset saranno DATE, STAZIONE1, STAZIONE2, …
1.    Per ogni stazione determinare la media della variabile SA relativamente alle osservazioni con data fino al 11/3/2011.
1.    Aggiungere al dataset una variabile INCREMENTO_SA ottenuta come differenza fra SA e la media di SA ottenuta al punto precedente. La variabile INCREMENTO_SA deve avere valore mancante in tutte le osservazioni fino al 11/3/2011.
1.    Leggere i dati del file StationLocations.csv e memorizzarli in un dataset SAS permanente. Notare che in questo file le stazioni hanno una variabile STATION_ID che è un numero progressivo che inizia con 1.
1.    Nel dataset otttenuto al punto 12 aggiungere una variabile DISTANZA_Q che contiene il quadrato della distanza dal punto con latitudine 37.422972 e longitudine 141.032917, ottenuta applicando la formula 802(latitudine - 37.422972)2 + 1112(longitudine - 141.032917)2.
1.    Per ogni sito (SITE_ID), determinare il numero di stazioni presenti.
1.    Fondere i due dataset contenenti i due file di dati grezzi letti, sfruttando la condivisione della variabile STATION_COD.
