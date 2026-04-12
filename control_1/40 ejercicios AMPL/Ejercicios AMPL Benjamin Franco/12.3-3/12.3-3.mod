var x1 >= 0;
var x2 >= 0;

minimize Z_objective:
  x1^4 + 2*x1^2 + 2*x1*x2 + 4*x2^2;

s.t. Constraint1:
  2*x1 + x2 >= 10;

s.t. Constraint2:
  x1 + 2*x2 >= 10;