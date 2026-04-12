set TIENDAS = 1..3;      
set CARGAS_POSIBLES = 0..5; 

param TOTAL_CARGAS = 5; 
param ganancia_estimada {CARGAS_POSIBLES, TIENDAS};

var X {c in CARGAS_POSIBLES, t in TIENDAS} binary;

maximize Ganancia_Total_Esperada:
    sum {c in CARGAS_POSIBLES, t in TIENDAS} ganancia_estimada[c, t] * X[c, t];

subject to Asignar_Una_Cantidad_Por_Tienda {t in TIENDAS}:
    sum {c in CARGAS_POSIBLES} X[c, t] = 1;

subject to Limite_Total_Cargas:
    sum {c in CARGAS_POSIBLES, t in TIENDAS} c * X[c, t] = TOTAL_CARGAS; 
