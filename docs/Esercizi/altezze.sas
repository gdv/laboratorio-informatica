libname corso '/folders/myfolders';
data corso.persone;
    infile '/folders/myfolders/altezze.csv' dlm=',' dsd firstobs=2;
    input nome$:99. cognome$:99. natoil DDMMYY8. altezza peso;
    bmi=peso/((altezza/100) ** 2);
    altezza_pollici=altezza/2.54;
run;

proc print data=corso.persone;
run;


data corso.persone;
    set corso.persone;
    if bmi<18.5 then tipo='inferiore';
    else if bmi ge 18.5 and bmi <20 then tipo='normopeso';
    else if bmi ge 20 and bmi <25 then tipo='superiore';
    else tipo='obeso';
run;

data secondo;
    set corso.persone;
    if bmi < 20;
run;

proc print data=corso.persone;
run;
