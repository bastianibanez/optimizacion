set I := {1,2,3};
set J := {1,2,3,4};

param c{i in I, j in J} >= 0;
param s{i in I} >= 0;
param d{j in J} >= 0;

var x{i in I, j in J} >= 0;

minimize Cost: sum{i in I, j in J} c[i,j] * x[i,j];
s.t.
Supply{i in I}: sum{j in J} x[i,j] = s[i];
Demand{j in J}: sum{i in I} x[i,j] = d[j];

