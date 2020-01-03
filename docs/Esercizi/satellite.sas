/*
punto 1
*/

data esame;
    infile '/folders/myfolders/satellite.txt';
    input prodotto $:30. numsatellite altitudine azimuth medio minimo massimo;
run;
proc print data=esame;
run;

proc means data=esame n nmiss;
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
