# -- Conjuntos ------------------------------
set PROCESO;                          # Procesos de produccion
set PRODUCTO;                         # Productos quimicos

# -- Parametros ------------------------------
param costo {PROCESO};                # costo [USD/hora] del proceso p
param produccion {PRODUCTO, PROCESO}; # Produccion del producto q por hora con el proceso p
param demanda {PRODUCTO};             # Demanda minima diaria del producto q

# -- Variables ------------------------------
var x {PROCESO} >= 0;                 # horas/dia del proceso p

# -- Funcion objectivo ------------------------------
minimize Costo:
  sum {p in PROCESO} costo[p] * x[p];

# -- Restricciones ------------------------------
s.t. Demanda {q in PRODUCTO}:
  sum {p in PROCESO} produccion[q,p] * x[p] >= demanda[q]
