libname compito '/folders/myfolders';

data compito.palloni;
    infile '/folders/myfolders/balloon.txt' firstobs=30 obs=2030;
    input A B
run;
