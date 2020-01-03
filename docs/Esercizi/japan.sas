/* ES. 1 */

libname lib '/folders/myfolders';

data lib.japan;
	infile '/folders/myfolders/japan.csv' dsd dlm='09'x firstobs=2;
	input station_cod  date yymmdd10. time_utc $10. sa ra;
	if sa < 0 then sa=.;
	if ra < 0 then ra=.;
run;

proc print data=lib.japan; run;

/* ES. 2 */
proc means data=lib.japan mean max std nway;
	var ra;
	class station_cod;
run;

/* ES. 3 */
proc freq data=lib.japan;
	tables date;
	weight ra;
run;


/* ES. 4 */
data japanSa;
	set lib.japan;
	if sa ne .;
run;
proc print data=japanSa; run;

/* ES. 5 */
proc means data=lib.japan mean nway;
	var ra;
	class date station_cod;
	output out=japanMeanStrat mean=raMedia;
run;

/* viene aggiunto un data step se  SAS 9.1*/
data japanRaMean;
	set japanMeanStrat;
	keep date station_cod raMedia;
run;

/* ES. 6 */
proc means data=japanRaMean min noprint;
	var raMedia;
	id station_cod;
	output out=japanMinMean minid=stazione min=minMedia;
run;

proc print data=japanMinMean;
	var stazione minMedia;
run;

/* ES. 8 */
proc means data=lib.japan mean nway;
	var sa;
	class station_cod;
	where date <= '10Mar2011'd;
	output out=japanEs8 mean=saMean;
run;


/* ES.  9 */
proc sort data=japanEs8;
	by station_cod;
run;

data lib.japanEs9;
	set lib.japan;
	incremento_SA = .;
run;

proc sort data=lib.japanEs9;
	by station_cod;
run;

data lib.japanEs9;
	merge lib.japanEs9 japanEs8;
	by station_cod;
run;

data lib.japanEs9;
	set lib.japanEs9;
	if date > '10Mar2011'd then incremento_SA = sa - saMean;
	drop _FREQ_ _TYPE_ saMean;
run;


/* ES. 10 */

data lib.stations;
	infile '/folders/myfolders/StationLocations.csv' dsd dlm=';'  firstobs=2;
	input Station_ID Station_COD Site_ID Site_Name_EN $ :20. Prefecture_ID Prefecture_Name_EN $ :20. Station_Name_EN $ :40. Station_Name2_EN $ :90. Latitude Longitude;
run;

proc print data=lib.stations; run;


/* ES. 11 */
data lib.stations;
	set lib.stations;
	distanza_Q = 80**2 * (Latitude - 37.422972)**2 + 111**2 * (Longitude - 141.032917)**2;
run;


/* ES. 12 */
proc means data=lib.stations n nway;
	class Site_ID;
	var Station_ID;
run;


/* ES. 13 */
proc sort data=lib.japan;
	by station_cod;
run;


proc sort data=lib.stations;
	by station_cod;
run;

data lib.japanStations;
	merge lib.japan lib.stations;
	by station_cod;
run;
