var x1 >= 0;
var x2 >= 0;

maximize f_x: log(x1 + 1) - x2^2; 

subject to Restriccion_Lineal:
    x1 + 2*x2 <= 3;