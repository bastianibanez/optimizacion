var x1 >= 0;
var x2 >= 0;

maximize f_x_b: 20*x1 + 10*x2;

subject to Restriccion1_b:
    x1^2 + x2^2 <= 1;

subject to Restriccion2_b:
    x1 + 2*x2 <= 2;