/* Calcolare le precipitazioni medie rilevate in ogni giorno/stazione, emettendo il risultato
in un nuovo dataset. Il nuovo dataset dovrebbe quindi avere variabili
GIORNO, STAZIONE, RA_MEDIA.  */
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

/* In quale stazione è stato rilevato il minimo valore di RA_MEDIA nel punto precedente? */
proc means data=japanRaMean min noprint;
	var raMedia;
	id station_cod;
	output out=japanMinMean minid=stazione min=minMedia;
run;

proc print data=japanMinMean;
	var stazione minMedia;
run;

/* Per ogni stazione determinare la media della variabile SA relativamente alle osservazioni
con data fino al 11/3/2011. */
proc means data=lib.japan mean nway;
	var sa;
	class station_cod;
	where date <= '10Mar2011'd;
	output out=japanEs8 mean=saMean;
run;


/* Aggiungere al dataset una variabile INCREMENTO_SA ottenuta come differenza fra SA e la media di SA
ottenuta al punto precedente. La variabile INCREMENTO_SA deve avere valore mancante in tutte le
osservazioni fino al 11/3/2011. */
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
