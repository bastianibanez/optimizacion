var x1 >= 0;
var x2 >= 0;

maximize f_x_a: x1 + 2*x2 - x2^3;

subject to Restriccion_a:
    x1 + x2 <= 1;