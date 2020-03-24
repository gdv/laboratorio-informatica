libname a '/folders/myfolders';
proc contents data=a.gareauto;run;

proc means data=a.gareauto nmiss;
var bonus_gara punti_gara punti_totali_gara;
run;

/*
1.Per ogni pilota, calcolare i punti totali
*/
proc means data=a.gareauto sum;
	var punti_totali_gara;
	class id;
run;

/*
2.Per ogni pilota calcolare il numero medio (e deviazione standard) 
  di punti totali
*/
proc means data=a.gareauto mean stddev;
	var punti_totali_gara;
	class id;
run;


/*
3.Come il punto precedente, ma solo relativamente 
  alle gare completate.
*/
proc means data=a.gareauto sum std;
	var punti_totali_gara;
	class id;
	where status_gara eq 'Running';
run;

/*
4.Per ogni pilota calcolare la somma totale di premi vinti, 
  di giri percorsi e di punti base ottenuti.
*/
proc means data=a.gareauto sum;
	var premio_gara giri_gara punti_gara;
	class id;
run;


