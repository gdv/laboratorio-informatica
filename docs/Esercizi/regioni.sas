/*
 * Salvo il file regioni.txt, poi leggo i dati
 */
libname libreria '/folders/myfolders';
data libreria.regioni;
    infile '/folders/myfolders/regioni.csv' dlm = ',' firstobs = 2;
    input regione $:20. popolazione superficie;
run;

data densi;
     set libreria.regioni;
    densita=popolazione/superficie;
run;


data piccole;
    set libreria.regioni;
    if superficie LT 10000;
run;
data grandi;
    set libreria.regioni;
    if superficie GT 20000;
run;
/*
 * creo ed esporto le regioni di media grandezza
 */
data medie;
    set libreria.regioni;
    if superficie GE 10000 AND superficie LE 20000;
run;

/* esportazione */

data medie;
    set medie;
    file '/folders/myfolders/esportati.txt' dlm=';';
    put regione :$99. popolazione superficie;
run;
