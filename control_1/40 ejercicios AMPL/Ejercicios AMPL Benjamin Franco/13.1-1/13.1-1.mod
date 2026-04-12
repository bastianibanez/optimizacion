set CIUDADES = 1..5; 

param M_GRANDE = 1000000; 

param distancia {i in CIUDADES, j in CIUDADES} default M_GRANDE;

var X {i in CIUDADES, j in CIUDADES: i != j} binary; 

var U {i in CIUDADES} >= 1, <= card(CIUDADES); 

minimize Distancia_Total:
    sum {i in CIUDADES, j in CIUDADES: i != j} distancia[i, j] * X[i, j];

subject to Salir_De_Cada_Ciudad {i in CIUDADES}:
    sum {j in CIUDADES: i != j} X[i, j] = 1;

subject to Llegar_A_Cada_Ciudad {j in CIUDADES}:
    sum {i in CIUDADES: i != j} X[i, j] = 1;

subject to Eliminar_Subtours {i in CIUDADES, j in CIUDADES: i != j and i != 1 and j != 1}:
    U[i] - U[j] + card(CIUDADES) * X[i, j] <= card(CIUDADES) - 1;