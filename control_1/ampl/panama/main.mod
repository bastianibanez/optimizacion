set I := {1..3};
set J := {1..4};

param c{I} >= 0;
param v{I} >= 0;
var x{I,J} >= 0 integer;

maximize Profit: sum{i in I, j in J} x[i,j] * v[i] - sum{i in I, j in J} c[i] * x[i,j];

s.t.
r1: sum{i in I, j in J} x[i,j] * c[i] <= 3000000;
r2: forall{j in J} sum{i in I} x[i,j] <= 12;

