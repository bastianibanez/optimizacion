# Centro de reciclaje
# Producir 1000 toneladas de aleacion especial usando chatarra A y B

var xA >= 0;
var xB >= 0;

minimize costo: 100*xA + 80*xB;

subject to total: xA + xB = 1000;

subject to aluminio_min: 0.06*xA + 0.03*xB >= 30;
subject to aluminio_max: 0.06*xA + 0.03*xB <= 60;

subject to silicio_min: 0.03*xA + 0.06*xB >= 30;
subject to silicio_max: 0.03*xA + 0.06*xB <= 50;

subject to carbono_min: 0.04*xA + 0.03*xB >= 30;
subject to carbono_max: 0.04*xA + 0.03*xB <= 70;

option solver cplex;
solve;
display xA, xB, costo;
