libname corso 'z:\FileSAS'
data corso.persone;
    infile 'Z:\FileSAS\altezze.txt';
    input nome$1-8 cognome$10-16 natoil DDMMYY8. altezza peso;
    bmi=peso/((altezza/100) ** 2);
    altezza_pollici=altezza/2.54;
run;

proc print data=corso.persone;
run;


data corso.persone;
    set corso.persone;
    if bmi<18.5 then tipo='sottopeso';
    else if bmi ge 18.5 and bmi <20 then tipo='normopeso';
    else if bmi ge 20 and bmi <25 then tipo='sovrappeso';
    else tipo='obeso';
run;

data secondo;
    set corso.persone;
    if bmi < 20;
run;
