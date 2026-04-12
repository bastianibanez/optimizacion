set PROYECTOS = 1..5; 

param ganancia {PROYECTOS};

param capital_requerido {PROYECTOS};

param capital_disponible;

var X {PROYECTOS} binary;

maximize Ganancia_Total:
    sum {j in PROYECTOS} ganancia[j] * X[j];

subject to Restriccion_Capital:
    sum {j in PROYECTOS} capital_requerido[j] * X[j] <= capital_disponible;