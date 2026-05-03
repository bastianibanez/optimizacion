# -- Conjuntos ------------------------------
set CHATARRA;
set ELEMENTO;

# -- Parametros ------------------------------
param costo {CHATARRA}; # costo [USD/tonelada] de cada proceso
param composicion_minima_aleacion{ELEMENTO}; # composicion minima de cada elemento en la aleacion final
param composicion_maxima_aleacion{ELEMENTO}; # composicion maxima de cada elemento en la aleacion final
param proporcion_elemento_chatarra{CHATARRA, ELEMENTO}; # proporcion de cada elemento en cada tipo de chatarra
param toneladas_aleacion; # toneladas de aleacion a producir

# -- Variables ------------------------------
var x {CHATARRA} >= 0; # toneladas de cada tipo de chatarra a utilizar

# -- Funcion objectivo ------------------------------
minimize Costo_Total:
  sum {i in CHATARRA} costo[i] * x[i];

# -- Restricciones ------------------------------
s.t. Composicion_Minima {j in ELEMENTO}:
  sum {i in CHATARRA} proporcion_elemento_chatarra[i,j] * x[i] >= composicion_minima_aleacion[j] * toneladas_aleacion;

s.t. Composicion_Maxima {j in ELEMENTO}:
  sum {i in CHATARRA} proporcion_elemento_chatarra[i,j] * x[i] <= composicion_maxima_aleacion[j] * toneladas_aleacion;

s.t. Toneladas_Produccion:
  sum {i in CHATARRA} x[i] = toneladas_aleacion;

## -- Data ------------------------------
data;

# -- Conjuntos ------------------------------
set CHATARRA := A B;
set ELEMENTO := 1 2 3;

# -- Parámetros ------------------------------
param costo := A 100 B 80;
param composicion_minima_aleacion := 1 0.03 2 0.03 3 0.03;
param composicion_maxima_aleacion := 1 0.06 2 0.05 3 0.07;
param proporcion_elemento_chatarra:
    1 2 3 :=
  A 0.06 0.03 0.04
  B 0.03 0.06 0.03;
param toneladas_aleacion := 1000;
