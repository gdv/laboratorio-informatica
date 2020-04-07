 /* Leggere i dati in ingresso e memorizzarli in un data set SAS permanente. */
libname esame '/folders/myfolders';
data esame.fema;
    infile '/folders/myfolders/FEMA2.csv' firstobs=2 dlm=';' dsd;
	input id State $:99.  County $:99. Applicant $:999. 
           EducationChar$ NumeroProgetti tipo $:99.  importo data YYMMDD10.;
run;
/* Salvare, in un dataset temporaneo, solo le prime 3 variabili del data set letto.

Stampare le osservazioni dello stato Texas del dataset originale,
visualizzando la data nel formato europeo (prima il giorno e dopo il mese)
e 0 o 1 a seconda che il proponente sia nel campo dell’istruzione o meno.
*/

data temp;
     set esame.fema;
     keep state county applicant;
run;

proc format;
     value $edu 'No' = '0'
                'Yes' = '1';
run;

proc print data=esame.fema;
    format data DDMMYY10.;
    format educationchar $edu.;
    where state = 'Texas';
	run;

/* Calcolare media, massimo e minimo della variabile amount */
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
    if numeroprogetti > 0 then
        rapporto=importo/NumeroProgetti;
    if state eq 'Texas';
run;
