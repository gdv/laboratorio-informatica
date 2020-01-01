Si richiede di scrivere un programma SAS per l’analisi dei [dati](../dati/auto.txt), secondo i seguenti punti. I dati grezzi che si trovano nel file rappresentano dei dati storici riguardanti alcuni dati di vari modelli di auto e sono associabili alle seguenti variabili:

*  MPG: consumo medio misurato come miglia percorse con un gallone di benzina.
*  CILINDRI: numero di cilindri del motore.
*  LUNGHEZZA: lunghezza veicolo (in pollici).
*  POTENZA: potenza del motore in HP.
*  PESO: in libbre.
*  ACCELERAZIONE: tempo (in sec.) per andare da 0 a 60 miglia/ora.
*  ANNO: anno introduzione modello.
*  ORIGINE: 1=americana, 2=europea, 3=giapponese.
*  MODELLO: nome del modello e casa costruttice.

Risolvere i seguenti punti.

1.    Leggere i dati in ingresso e memorizzarli in un dataset SAS permanente.

1.    Tenendo conto che 1 miglio = 1.60935 km e 1 gallone = 4.4 litri, esprimere il consumo medio con litri necessari per percorrere 100 km.

1.    Calcolare media, deviazione standard e skewness della variabile POTENZA stratificata per ANNO.

1.    Costruire una tabella a 2 entrate i cui assi rappresentino l’origine del costruttore l’anno di introduzione del modello, e il dato in ogni cella del dataset deve essere il numero di modelli introdotti nell’anno da un costruttore con determinata origine. Nella tabella devono essere presenti le varie ripartizioni percentuali. Ad esempio nella cella con etichetta (72,2) si troverà il numero di modelli introdotti nel 1972 da costruttori europei, inoltre nella tabella si deve avere la percentuale di modelli introdotti nel 1972.
