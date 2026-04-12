set I := {1,3,4,5,9};
set A := {2,6,7,8};
set J := {1..8};

param c{I union A} >= 0;
param d{J} >= 0;
param a{I union A,J} >= 0;

var x{I} >= 0;
var y{A} >= 0 integer;

minimize Cost: sum{i in I} c[i] * x[i] + sum{i in A} c[i] * y[i];

s.t.
r1{j in J}: sum{i in I} a[i,j] * x[i] + sum{i in A} a[i,j] * y[i] >= d[j];

