set DISTRITOS = 1..4;         
set VOLUNTARIOS_POSIBLES = 0..6; 

param TOTAL_VOLUNTARIOS = 6; 

var X {v in VOLUNTARIOS_POSIBLES, d in DISTRITOS} binary;

maximize Aumento_Total_Votos:
    sum {v in VOLUNTARIOS_POSIBLES, d in DISTRITOS} votos_estimados[v, d] * X[v, d];

subject to Asignar_Una_Cantidad_Por_Distrito {d in DISTRITOS}:
    sum {v in VOLUNTARIOS_POSIBLES} X[v, d] = 1;

subject to Limite_Total_Voluntarios:
    sum {v in VOLUNTARIOS_POSIBLES, d in DISTRITOS} v * X[v, d] = TOTAL_VOLUNTARIOS;