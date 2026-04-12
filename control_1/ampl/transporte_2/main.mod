set I := {1..3};
set J := {1..6};

param c{I,J};
param s{I};
param d{J};

var x{I,J} >= 0 integer;

minimize Cost: sum{i in I, j in J} c[i,j] * x[i,j];

s.t.
Supply{i in I}: sum{j in J} x[i,j] <= s[i];
Demand{j in J}: sum{i in I} x[i,j] >= d[j];
