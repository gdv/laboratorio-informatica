libname corso '/folders/myfolders';
data vento;
        infile '/folders/myfolders/vento.csv' dlm=',' dsd;
        input anno mese giorno velocita stazione;
run;
	

/* punto 2 */
proc means data=vento n;
    var velocita;
    where stazione = 1;
    class anno;
run;

/* oppure */
proc freq data=vento;
    tables anno;
    where velocita ne .;
run;

/* punto 3 */
proc means data=vento nway noprint;
    var velocita;
    class stazione;
    output out=punto4 mean=media;
run;
proc means data=punto4 noprint min;
    var media;
    id stazione;
    output out=punto4b minid=quale;
run;
proc print data=punto4b; var quale; run;

/* punto 4 */
proc freq data=vento;
    tables stazione*anno;
    weight velocita;
run;

/* punto 5 */
ods trace on;
proc freq data=vento;
    tables stazione*anno;
    weight velocita;
    ODS OUTPUT  Freq.Table1.CrossTabFreqs = dataset2;
run;
ods trace off;

data dataset2;
    set dataset2;
    if percent >= 1 and stazione ne . and anno ne .;
    keep anno stazione percent;
run;
