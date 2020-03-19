/*
Gli studenti dovranno consegnare un breve programma in SAS, su cui non riceveranno feedback.
Eventuali dubbi o richieste devono essere poste tramite il Forum di questa settimana.

    Leggere il file di dati balloon.txt e importarli in un dataset permanente. 
*/

libname a "/folders/myfolders/sasuser.v94";

data a.palloni;
    infile "/folders/myshortcuts/repo/dati/balloon.txt" firstobs=30 obs=2030;
    input a b;
run;