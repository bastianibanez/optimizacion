set CIUDADES;  

param d{CIUDADES, CIUDADES} >= 0, default 1e6;  

var x{CIUDADES, CIUDADES} binary;
var u{CIUDADES} >= 0;

minimize distancia_total:
  sum {i in CIUDADES, j in CIUDADES: i != j} d[i,j] * x[i,j];

subject to entrada_unica{j in CIUDADES}:
  sum {i in CIUDADES: i != j} x[i,j] = 1;

subject to salida_unica{i in CIUDADES}:
  sum {j in CIUDADES: j != i} x[i,j] = 1;

subject to subtour_eliminacion{i in CIUDADES, j in CIUDADES: i != j and i != 1 and j != 1}:
  u[i] - u[j] + (card(CIUDADES) - 1) * x[i,j] <= card(CIUDADES) - 2;
