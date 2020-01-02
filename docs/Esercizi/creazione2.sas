libname compito '/folders/myfolders';

data compito.baseball;
    infile '/folders/myfolders/attend.dat' firstobs=2;
    input city $   League $ Div $     Year   Total       Index1  Index2 Index3 Index4  Rate;
run;

data compito.wheat;
    infile '/folders/myfolders/wheat.txt' firstobs=2 obs=9 missover;
    input A B C d1-d15
run;

data compito.palloni;
    infile '/folders/myfolders/balloon.txt' firstobs=30 obs=2030;
    input A B C d1-d15
run;

data turismo;
    infile '/folders/myfolders/braziltourism.csv' dlm=',' dsd firstobs=2;
    input Age Sex Income TravelCost AccessRoad Active Passive LoggedIncome Trips;
run;
