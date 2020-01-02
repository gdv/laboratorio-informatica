libname es '/folders/myfolders';

/*
 * siccome i dati grezzi sono in formato csv, devo utilizzare le opzioni dlm e dsd
 */
data es.peso;
    infile '/folders/myfolders/dieta.csv' dlm=',' dsd;
    input codice nome$:40. squadra$ pesoiniziale pesofinale eta sesso$;
run;

/*
 * Punto 1
 */

proc means data=es.peso mean stddev;
    var pesofinale;
    class squadra;
    output out=statistiche mean=media stddev=deviazione;
run;

/*
 * Punto 3
 */

data es.peso;
    set es.peso;
    perso=pesoiniziale-pesofinale;
    percentuale=perso/pesoiniziale*100;
    if percentuale ge 7 then obiettivo=1;
    else obiettivo=0;
run;


/*
 * Punto 4
 *
 * notare la clausola where che ci permette di restringere il calcolo delle
 * statistiche alle sole osservazioni dove l'obiettivo è stato raggiunto
 *
 */
proc means data=es.peso n nway;
    var obiettivo;
    class sesso;
    where obiettivo=1;
run;


/*
 * Punto 5
 */

proc means data=es.peso n nway noprint;
    var obiettivo;
    by squadra;
    output out=totali n=componenti sum(obiettivo)=raggiunto;
run;

data totali;
    set totali;
    percentuale = raggiunto/componenti*100;
run;

proc sort data=totali;
    by descending percentuale;
proc print data=totali;
run;

/*
* Soluzione alternativa che non tiene conto del valore specifico di obiettivo;
* L'idea è valida in generale;

proc sort data=es.peso;
    by squadra;
run;
proc means data=es.peso n nway noprint;
    var obiettivo;
    by squadra;
    output out=raggiunto n=raggiunto;
    where obiettivo eq 1;
run;
proc means data=es.peso n nway noprint;
    var obiettivo;
    by squadra;
    output out=totali n=componenti;
run;
data percentuali;
    merge raggiunto totali;
    by squadra;
    percentuale=raggiunto/componenti*100;
run;
proc print data=percentuali;run;
    */

/*
Punto 6

costruisco un dataset contenente il numero di persone per squadra che non hanno
raggiunto l'obiettivo (solo le squadre in cui almeno un componente non ha raggiunto l'obiettivo)
*/
proc means data=es.peso n nway;
    var obiettivo;
    class squadra;
    where obiettivo=0;
    output out=sommario n=nonraggiunto;
run;

proc sort data=sommario;
    by descending nonraggiunto;
run;

proc print data=sommario;run;
