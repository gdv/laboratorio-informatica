/*
punto 1
*/
libname lib 'Z:\FileSAS';
data lib.esame;
    infile 'Z:\FileSAS\auto.txt';
    input MPG 1-6 CILINDRI 7-9 LUNGHEZZA 10-15 POTENZA 16-21 PESO 22-28 ACCELERAZIONE 29-34 ANNO 35-38 ORIGINE 39-41 MODELLO$ 42-86;
run;




/*
punto 2
*/
data consumi;
    set lib.esame;
    consumo=4.4*100/ (1.60935  *mpg);
    keep modello consumo;
run;


/*
punto 3
*/

proc means data=lib.esame mean stddev skewness;
    var potenza;
    class anno;
run;

/*
punto 4
*/
proc freq  data=lib.esame;
    tables anno*origine;
run;
