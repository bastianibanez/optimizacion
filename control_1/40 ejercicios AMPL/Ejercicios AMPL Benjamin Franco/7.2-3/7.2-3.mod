param theta >= 0; 

var x1 >= 0;
var x2 >= 0;
var x3 >= 0;

maximize Z_theta:
  (10 - theta) * x1 + (12 + theta) * x2 + (7 + 2*theta) * x3;

s.t. Constraint1:
  x1 + 2*x2 + 2*x3 <= 30;

s.t. Constraint2:
  x1 + x2 + x3 <= 20;