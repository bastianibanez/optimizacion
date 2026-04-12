set JUGUETES = 1..2; 
set PLANTAS = 1..2;  

param costo_preparacion {JUGUETES};

param ganancia_unitaria {JUGUETES};

param tasa_produccion {JUGUETES, PLANTAS};

param horas_disponibles {PLANTAS};

var X {JUGUETES} >= 0;

var Y {JUGUETES} binary;

var Z {PLANTAS} binary;

maximize Ganancia_Total:
    sum {j in JUGUETES} ganancia_unitaria[j] * X[j] -
    sum {j in JUGUETES} costo_preparacion[j] * Y[j];

subject to Seleccion_Una_Planta:
    sum {p in PLANTAS} Z[p] = 1;
param M_prod_large; 

subject to Horas_Por_Planta {p in PLANTAS}:
    sum {j in JUGUETES} (X[j] / tasa_produccion[j,p]) <= horas_disponibles[p] + M_prod_large * (1 - Z[p]);

subject to Enlace_Produccion_con_Fabricacion {j in JUGUETES}:
    X[j] <= M_prod_large * Y[j]; 
