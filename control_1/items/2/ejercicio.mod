# Charcha - Maximizar utilidad semanal
# Produccion de productos A, B, C, D a partir de materia prima

# -- Variables -----------------------------------------
var m1 >= 0;   # lbs materia prima para insumo 1
var m2 >= 0;   # lbs materia prima para insumo 2
var x1 >= 0;   # corridas proceso 1 (produce 1 oz producto A cada una)
var x2 >= 0;   # corridas proceso 2 (produce 1 oz producto B cada una)
var xC >= 0;   # oz de producto C
var xD >= 0;   # oz de producto D
var w  >= 0;   # oz de desecho vertido al rio

# -- Funcion objetivo ----------------------------------
maximize Utilidad:
    17*x1 + 16*x2 + 7*xC + 2*xD - 8*m1 - 10*m2;

# -- Restricciones -------------------------------------

# Balance insumo 1: produccion >= consumo
subject to Insumo1:
    2*x1 + x2 + 2*xC <= 2*m1;

# Balance insumo 2: produccion >= consumo
subject to Insumo2:
    x1 + 2*x2 + 2*xD <= 3*m2;

# Balance de desecho liquido: generado = usado + vertido
subject to Desecho:
    x1 + 0.8*x2 = 0.8*xC + 1.2*xD + w;

# Limite de vertido al rio
subject to Rio:
    w <= 1000;

# Tiempo disponible (6000 h/semana)
subject to Tiempo:
    2*m1 + 2*m2 + 2*x1 + 3*x2 + xC + xD <= 6000;

# Limite de ventas producto A
subject to VentasA:
    x1 <= 5000;

# Limite de ventas producto B
subject to VentasB:
    x2 <= 5000;

# -- Resolver y mostrar resultados ---------------------
option solver cplex;
solve;

display m1, m2, x1, x2, xC, xD, w, Utilidad;
