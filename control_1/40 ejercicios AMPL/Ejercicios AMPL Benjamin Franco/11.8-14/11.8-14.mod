var x {1..9} binary;

maximize Z:
   2*x[1] + 3*x[2] + x[3] + 4*x[4] + 3*x[5] + 2*x[6] + 2*x[7] + x[8] + 3*x[9];

s.t. const1:
   3*x[2] + x[4] + x[5] = 3;

s.t. const2:
   x[1] + x[2] <= 1;

s.t. const3:
   x[2] + x[4] - x[5] - x[6] >= -1; 

s.t. const4:
   x[2] + 2*x[6] + 3*x[7] + x[8] + 2*x[9] = 4;

s.t. const5:
   -x[3] + 2*x[5] + x[6] + 2*x[7] - 2*x[8] + x[9] >= 5;