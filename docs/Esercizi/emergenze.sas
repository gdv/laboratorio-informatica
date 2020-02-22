/* Leggere i dati in ingresso e memorizzarli in un data set SAS permanente. */
libname esame '/folders/myfolders';
data esame.fema;
    infile '/folders/myfolders/FEMA2.csv' firstobs=2 dlm=';' dsd;
	input id State $:99.  County $:99. Applicant $:999. 
           EducationChar$ NumeroProgetti tipo $:99.  importo data YYMMDD10.;
run;
/* Stampare solo le prime 3 variabili del data set letto, visualizzando la data nel formato europeo (prima */
/* il giorno e dopo il mese). */

proc print data=esame.fema;
	format data DDMMYY10.;
	run;

/* Calcolare media, massimo e minimo della variabile Federal Share Obligated */
/* stratificata per County. */
proc means data=esame.fema mean max min;
    var importo;
    class county;
run;

/* Ripetere il punto precedente solo sulle osservazioni dell'anno 2008. */
proc means data=esame.fema mean max min;
    var importo;
    class county;
    where data>='01Jan2008'd and data<'01Jan2009'd;
run;
/* oppure */
proc means data=esame.fema mean max min;
    var importo;
    class county;
    where year(data) = 2008;
run;


/* Creare un nuovo dataset temporaneo contenente solo le osservazioni relative */
/* allo Stato del Texas. */
/* Nel nuovo dataset creare una nuova variabile StanziamentoMedio */
/* che contiene il rapporto fra i fondi stanziati e il numero di progetti. */
data nuovo;
    set esame.fema;
    rapporto=importo/NumeroProgetti;
    if state eq 'Texas';
run;
