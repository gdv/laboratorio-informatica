/*
punto 1
*/

data satellite;
    infile '/folders/myfolders/satellite.txt';
    input prodotto $:30. numsatellite altitudine azimuth medio minimo massimo;
run;
proc print data=satellite;
run;

proc means data=satellite n nmiss;
run;
/*
punto 2
*/
proc means data=satellite mean;
    var altitudine azimuth;
    class numsatellite;
    output out=punto2 mean(altitudine)=altezzamedia;
run;
/*
punto 3
*/
proc means data=satellite mean stddev skewness;
    var minimo;
run;
/*
punto 4
*/
data nuovo;
    set satellite;
    scarto=massimo-minimo;
run;
/*
punto 5
*/
proc means nway data=nuovo mean;
	var scarto;
	class numsatellite;
	output out=eserc mean=scarto_medio;
run;
proc sort data=eserc;
	by scarto_medio;
run;

/*
punto 6
*/
proc means nway data=nuovo mean;
	var altitudine;
	class numsatellite;
	output out=altitudine mean=altitudine_media;
run;

proc sort data=altitudine;
	by numsatellite;
run;
proc sort data=esame;
	by numsatellite;
run;

data punto6;
    merge esame altitudine;
    by numsatellite;
run;

proc print data=punto6;
run;

/* 
    Calcolare come la variabile scarto sia distribuita fra i vari prodotti
    */
proc freq data=satelliti;
    tables prodotto;
    weight scarto;
run;    

/*
    Salvare il risultato del punto precedente in un nuovo dataset
*/   

ods trace on;
proc freq data=satelliti;
    tables prodotto;
    weight scarto;
run;    
ods trace off;


proc freq data=satelliti;
    tables prodotto;
    weight scarto;
    ods output Freq.Table1.OneWayFreqs = tabella ;
run;    

