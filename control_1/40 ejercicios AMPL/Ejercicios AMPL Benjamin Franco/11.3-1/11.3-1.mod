set PRODUCTOS := 1..4; 

param costo_arranque {PRODUCTOS};

param ingreso_marginal {PRODUCTOS};

param M;
param M_prod_large;

var X {PRODUCTOS} >= 0;
var Y {PRODUCTOS} binary;

maximize Ganancia_Total:
    sum {j in PRODUCTOS} ingreso_marginal[j] * X[j] -
    sum {j in PRODUCTOS} costo_arranque[j] * Y[j];

subject to Maximo_Dos_Productos:
    sum {j in PRODUCTOS} Y[j] <= 2;

subject to Condicion_Producto3_o_4:
    Y[3] <= Y[1] + Y[2];
subject to Condicion_Producto4_o_3:
    Y[4] <= Y[1] + Y[2];

var Z_or binary; 

param large_number; 

subject to Disyuntiva1:
    5*X[1] + 3*X[2] + 6*X[3] + 4*X[4] <= 6000 + M * (1 - Z_or);
subject to Disyuntiva2:
    4*X[1] + 6*X[2] + 3*X[3] + 5*X[4] <= 6000 + M * Z_or;

subject to Enlace_Produccion {j in PRODUCTOS}:
    X[j] <= M_prod_large * Y[j];