data elezioni;
        infile '/folders/myfolders/fl2000.csv' dlm=',' dsd firstobs=2;
        input county $:99. technology $:20. columns codice numero_voti;
        /* codice = 1 => schede bianche,
           codice = 2 => nulle
        */
run;
proc print data=elezioni;run;


/* punto 1 */
proc means data=elezioni sum;
        var numero_voti;
        class codice;
        where codice > 2;
run;

/* punti 1 e 2 */

proc format;
    value candidato
        1='Bianche'
        2='Nulle'
        3='Bush'
        4='Gore'
        5='Browne'
        6='Nader'
        7='Harris'
        8='Hagelin'
        9='Buchanan'
        10='McReynolds'
        11='Phylips'
        12='Moorehead'
        13='Chote'
        14='McCharthy';
run;


proc freq data=elezioni;
        format codice candidato.;
        weight numero_voti;
        tables  codice;
        where codice > 2;
run;

/* punto 3 */
proc means data=elezioni noprint nway;
        var numero_voti;
        class county;
        id codice;
        output out=punto3 maxid=candidato_vincente max=voti;
run;
proc print data=punto3;
        var county candidato_vincente voti;
        format candidato_vincente candidato.;
run;

/* punto 4 */
/* si potrebbe anche usare una proc freq */
proc means data=elezioni sum nway;
        var numero_voti;
        class columns codice;
        output out=punto4c sum=totale_voti;
proc means data=elezioni sum nway;
        var numero_voti;
        class technology codice;
        output out=punto4t sum=totale_voti;
run;

/* punto 5 */
/* prima viene costruito un dataset dove il numero di voti non validi di ogni contea viene calcolato */
proc means data=elezioni sum;
        var numero_voti;
        class county;
        where codice <= 2;
        output out = nonvalidi sum = nonvalidi;
run;

/* costruiamo un dataset con il numero totale di voti di ogni contea */
proc means data=elezioni sum;
        var numero_voti;
        class county;
        output out = voti_totale sum = voti;
run;

/* adesso fondo i due dataset per avere un unico dataset con voti totali e voti non validi */


proc sort data=nonvalidi; by county; run;
proc sort data=voti_totale; by county; run;

data punto5c;
    merge nonvalidi voti_totale;
    by county;
    percentuale_non_validi=nonvalidi/voti;
run;
proc print data=punto5c;run;

/* nel nuovo dataset posso usare un maxid per estrarre le informazioni richieste */

proc means data=punto5c noprint nway;
    var percentuale_non_validi nonvalidi;
    id county;
    output out=punto5d maxid(percentuale_non_validi)=dove_percentuale maxid(nonvalidi)=dove_assoluto;
run;
proc print data=punto5d;
     var dove_percentuale dove_assoluto;
run;

/* punto 6 */
ods trace on;
proc freq data=elezioni;
    tables codice*county;
    weight numero_voti;
    where codice>2;
    ods output Freq.Table1.CrossTabFreqs=punto6ods;
run;
ods trace off;

proc means data=punto6ods n;
    where codice=6 and ColPercent >= 2;
    var codice;
run;
