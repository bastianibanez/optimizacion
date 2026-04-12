var x1 >= 0;
var x2 >= 0;
var x3 >= 0;

maximize Z_objective:
  5*x1 + 4*x2 + 3*x3;

s.t. Resource1_Constraint:
  x1 + x3 <= 15;

s.t. Resource2_Constraint:
  x2 + 2*x3 <= 25;