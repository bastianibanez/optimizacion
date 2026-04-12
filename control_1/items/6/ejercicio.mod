# Brady Corporation - Minimizacion de costos de abastecimiento de tablones
# Necesita 90,000 pies cubicos de tablones utiles por semana

# -- Variables -----------------------------------------
var x1 >= 0;   # pies cubicos de tablones grado 1 comprados
var x2 >= 0;   # pies cubicos de tablones grado 2 comprados
var xT >= 0;   # pies cubicos de troncos procesados

# -- Funcion objetivo ----------------------------------
# Costos totales por pie cubico de entrada:
#   Grado 1: $3 (compra) + $4 (secado) = $7
#   Grado 2: $7 (compra) + $4 (secado) = $11
#   Troncos: $2.5 (flete) + $3 (corte) + $4 (secado) = $9.5
minimize costo_total:
    7 * x1 + 11 * x2 + 9.5 * xT;

# -- Restricciones -------------------------------------
# Demanda: rendimiento util >= 90,000 pies cubicos
subject to demanda:
    0.7 * x1 + 0.9 * x2 + 0.8 * xT >= 90000;

# Capacidad del aserradero (solo troncos)
subject to aserradero:
    xT <= 35000;

# Oferta maxima de tablones
subject to oferta_grado1:
    x1 <= 40000;

subject to oferta_grado2:
    x2 <= 60000;

# Tiempo de secado: 40 h/sem = 144,000 s/sem
subject to secado:
    1.2 * x1 + 0.8 * x2 + 1.3 * xT <= 144000;

# -- Resolver y mostrar resultados ---------------------
option solver cplex;
solve;

display x1, x2, xT;
display costo_total;
