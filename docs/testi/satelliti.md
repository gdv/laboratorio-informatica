Scrivere un programma SAS per l’analisi dei dati presenti nel file [satellite.txt](../dati/satellite.txt), secondo i seguenti punti. I dati grezzi che si trovano nel file rappresentano i risultati di prove di alcuni prodotti elettronici. I dati sono associabili alle seguenti variabili:

*    PRODOTTO: il nome del prodotto a cui si riferisce l’osservazione.
*    NUMSATELLITE: numero progressivo del satellite a cui si riferisce l’osservazione.
*    ALTITUDINE: altitudine rilevata per il satellite.
*    AZIMUTH: azimuth rilevata per il satellite.
*    MEDIO: valore medio del rapporto segnale/rumore (SNR) rilevato.
*    MINIMO: valore minimo del rapporto segnale/rumore (SNR) rilevato.
*    MASSIMO: valore massimo del rapporto segnale/rumore (SNR) rilevato.

Risolvere i seguenti punti.

1.    Leggere i dati in ingresso e memorizzarli in un dataset SAS temporaneo.
1.    Calcolare il valore medio di altitudine e azimuth stratificato per satellite (variabile NUMSATELLITE).
1.    Calcolare media, deviazione standard e skewness della variabile minimo.
1.    Aggiungere al dataset una variabile SCARTO che contenga la differenza fra MASSIMO e MINIMO.
1.    Calcolare, per ogni satellite, il valore medio della variabile scarto, e stampare i satelliti in ordine crescente di tale valore medio.
1.    Ristrutturare il dataset in modo da avere una osservazione per satellite e come variabili le altitudini e azimuth dei vari satelliti. Quindi la prima osservazione dovrebbe contenere i dati: 1 36 77 36 81 35 86 36 70
1.    Aggiungere al dataset iniziale una variabile di nome ALTEZZA_MEDIA contenente i dati ottenuti al punto 2 relativi alla variabile ALTITUDINE. Notare che lo stesso valore deve essere aggiunto a tutte le osservazioni che si riferiscono allo stesso satellite.
