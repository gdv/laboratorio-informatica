libname compito '/folders/myfolders';

data compito.baseball;
    infile '/folders/myfolders/attend.dat' firstobs=2;
    input city $   League $ Div $     Year   Total       Index1  Index2 Index3 Index4  Rate;
run;
