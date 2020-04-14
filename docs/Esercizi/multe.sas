/*

Si richiede di scrivere un programma SAS per l’analisi dei dati presenti nei file 
multe.csv e codici.csv  secondo i punti che seguono.

Si può importare il file di dati.
*/

/*
Leggere i dati del file multe.csv in un dataset permanente. Se non specificato, ogni operazione deve essere eseguita su tale dataset. Ogni osservazione corrisponde ad una multa comminata. Le variabili sono presenti nel file.
*/
libname b '/folders/myshortcuts/repo/dati';

/*
Controllare se sono presenti valori mancanti.
*/

proc means data=b.multe n nmiss;
run;

proc print data=b.multe;
    where fine_amount = .;
run;
/*
Creare una nuova variabile ANNO ottenuta prendendo la parte intera di MARKED TIME diviso 100.
*/

proc contents data=b.multe;
run;

data b.multe;
    set b.multe;
    anno = int(Marked_Time / 100);
run;

/*
Costruire un nuovo dataset permanente che contiene le osservazioni dove RP STATE PLATE è 
diverso da CA.
*/

data b.nuovo;
    set b.multe;
    if rp_state_plate ne 'CA';
run;   

/*
Calcolare media, minimo e deviazione standard di FINE AMOUNT stratificato per RP STATE PLATE.
*/

proc means data=b.multe mean min std nway;
    var fine_amount;
    class rp_state_plate;
    output out=medie mean=multa_media;
run;    

/*
Individuare quale RP STATE PLATE ha avuto il valore medio di FINE AMOUNT (calcolato al punto 
precedente) più basso.
*/

proc means data=medie min;
    var multa_media;
    id rp_state_plate;
    output out=esercizio minid=quale;
run;    

proc print data=esercizio;
    var quale;
run;    

/*
Indicare, sia in valore assoluto che in percentuale, come il numero di multe sia ripartito 
fra i vari tipi di infrazione (VIOLATION DESCRIPTION).
*/
proc freq data=b.multe;
    tables violation_description;
run;    

/* se fosse stato richiesto di indicare come gli importi delle multe siano ripartiti fra i 
vari tipi di infrazione */

proc freq data=b.multe;
    tables violation_description;
    weight fine_amount;
run;    

/*
Emettere i risultati del punto precedente in un nuovo dataset temporaneo.
*/

ods trace on;
proc freq data=b.multe;
    tables violation_description;
run;    
ods trace off;


proc freq data=b.multe;
    tables violation_description;
    ods output Freq.Table1.OneWayFreqs = tabella;
run;    



/*
Leggere i dati del file codici.csv in un dataset temporaneo.
Si può importare il file di dati.
*/

/*
Fondere i dataset al punto precedente con quello originale, sfruttando il campo AGENCY.
*/

proc sort data=b.multe;
    by agency;
run;    
proc sort data=work.codici;
    by agency;
run;    

data  complessivo;
    merge b.multe codici;
    by agency;
run;    
