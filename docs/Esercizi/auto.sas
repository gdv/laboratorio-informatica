/*
punto 1
*/
libname lib '/folders/myfolders';
data lib.esame;
    infile '/folders/myfolders/mpg.csv' dlm=',' dsd;
    input MPG CILINDRI LUNGHEZZA POTENZA PESO ACCELERAZIONE ANNO ORIGINE MODELLO :$99;
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
