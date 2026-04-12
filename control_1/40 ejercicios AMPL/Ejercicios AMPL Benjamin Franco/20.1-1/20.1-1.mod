set MAQUINAS;
set PRODUCTOS;

param tiempo_disponible {MAQUINAS};

param coef_productividad {MAQUINAS, PRODUCTOS};

param ganancia_unitaria {PRODUCTOS};

param demanda_max_P3 := 20; 

var X {PRODUCTOS} >= 0;

maximize Ganancia_Total: sum {j in PRODUCTOS} ganancia_unitaria[j] * X[j];

subject to Restriccion_Maquina {i in MAQUINAS}:
    sum {j in PRODUCTOS} coef_productividad[i,j] * X[j] <= tiempo_disponible[i];

subject to Demanda_Producto3:
    X['Producto3'] <= demanda_max_P3;