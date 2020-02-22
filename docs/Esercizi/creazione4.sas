data turismo;
    infile '/folders/myfolders/braziltourism.csv' dlm=',' dsd firstobs=2;
    input Age Sex Income TravelCost AccessRoad Active Passive LoggedIncome Trips;
run;
