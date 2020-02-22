/* Determinare quale stato ha ricevuto la quantità  maggiore di fondi totali */
/* (quindi bisogna determinare per ogni stato il totale dei fondi ricevuti). */
proc means data=esame.fema sum noprint nway;
    var importo;
    class state;
    output out=distribuzione sum=totale;
run;
proc means data=distribuzione noprint nway;
    var totale;
    id state;
    output out=risultato maxid=quale;
run;
proc print data=risultato;
    var quale;
run;



/* Determinare come i fondi siano stati ripartiti, sia in valore assoluto che in */
/* percentuale, rispetto allo stato e al fatto che il richiedente sia nel campo */
/* dell'istruzione (Education Applicant). */

proc freq data=esame.fema;
    tables EducationChar*State;
    weight importo;
run;


/* Creare un nuovo data set con i risultati ottenuti al punto precedente. */
ods trace on;
proc freq data=esame.fema;
    tables EducationChar*State;
    weight importo;

run;
ods trace off;

proc freq data=esame.fema;
	tables EducationChar*State;
    weight importo;
	ods output Freq.Table1.CrossTabFreqs = risultati;
run;
proc print data=risultati;run;

/* Leggere il file di dati FEMA2.txt contenente, per ogni tipologia di emergenza, */
/* un valore di severità  associato. */
data legenda;
    infile '/folders/myfolders/FEMA2.txt';
	input valore 1-2 tipo$:99.;
run;


proc sort data=esame.fema;
    by tipo;
run;
proc sort data=legenda;
    by tipo;
run;

/* punto 12 */
data punto15;
    merge legenda esame.fema;
    by tipo;
run;

