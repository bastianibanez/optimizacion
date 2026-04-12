set FABRICAS;  
set CLIENTES;  

param costo_envio {FABRICAS, CLIENTES};

param produccion_fabrica {FABRICAS};

param demanda_cliente {CLIENTES};

var X {FABRICAS, CLIENTES} >= 0;

minimize Costo_Total_Envio:
    sum {f in FABRICAS, c in CLIENTES} costo_envio[f,c] * X[f,c];

subject to Limite_Produccion {f in FABRICAS}:
    sum {c in CLIENTES} X[f,c] <= produccion_fabrica[f];

subject to Satisfacer_Demanda {c in CLIENTES}:
    sum {f in FABRICAS} X[f,c] = demanda_cliente[c];