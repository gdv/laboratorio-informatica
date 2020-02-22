libname compito '/folders/myfolders';

data compito.wheat;
    infile '/folders/myfolders/wheat.txt' firstobs=2 obs=9 missover;
    input A B C d1-d15
run;
