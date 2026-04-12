set BARCOS = 1..4; 
set PUERTOS = 1..4; 
param costo {BARCOS, PUERTOS};

var X {i in BARCOS, j in PUERTOS} binary;

minimize Costo_Total:
    sum {i in BARCOS, j in PUERTOS} costo[i, j] * X[i, j];

subject to Cada_Barco_Una_Asignacion {i in BARCOS}:
    sum {j in PUERTOS} X[i, j] = 1;

subject to Cada_Puerto_Un_Barco {j in PUERTOS}:
    sum {i in BARCOS} X[i, j] = 1;
