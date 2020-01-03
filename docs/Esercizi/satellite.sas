/*
punto 1
*/

data esame;
    infile '/folders/myfolders/dati.txt';
    input prodotto$ 1-13 numsatellite altitudine azimuth medio minimo massimo 3.;
run;
proc print data=esame;
run;
/*
punto 2
*/
proc means data=esame mean;
    var altitudine azimuth;
    class numsatellite;
    output out=punto2 mean(altitudine)=altezzamedia;
run;
/*
punto 3
*/
proc means data=esame mean stddev skewness;
    var minimo;
run;
/*
punto 4
*/
data nuovo;
    set esame;
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
punto 7
*/
data punto9;
    merge esame punto2;
    by satellite;
run;
