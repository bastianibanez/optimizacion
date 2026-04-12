set ORIGINS;       
set DESTINATIONS;  

param supply {ORIGINS};       
param demand {DESTINATIONS};  
param cost {ORIGINS, DESTINATIONS}; 

var x {ORIGINS, DESTINATIONS} >= 0;

minimize TotalCost:
   sum {i in ORIGINS, j in DESTINATIONS} cost[i,j] * x[i,j];

s.t. SupplyConstraint {i in ORIGINS}:
   sum {j in DESTINATIONS} x[i,j] <= supply[i];

s.t. DemandConstraint {j in DESTINATIONS}:
   sum {i in ORIGINS} x[i,j] = demand[j];