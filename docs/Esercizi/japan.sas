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
