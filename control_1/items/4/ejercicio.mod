# Donovan Enterprises - Planificacion de produccion de licuadoras
# Minimizar costo total (salarios + inventario)

# -- Variables -----------------------------------------
# Empleados con trimestre libre s (continuas, relajacion LP)
var w1 >= 0;   # empleados con trimestre 1 libre
var w2 >= 0;   # empleados con trimestre 2 libre
var w3 >= 0;   # empleados con trimestre 3 libre
var w4 >= 0;   # empleados con trimestre 4 libre

# Produccion en cada trimestre
var P1 >= 0;
var P2 >= 0;
var P3 >= 0;
var P4 >= 0;

# Inventario al final de cada trimestre
var I1 >= 0;
var I2 >= 0;
var I3 >= 0;
var I4 >= 0;

# -- Funcion objetivo ----------------------------------
minimize costo_total:
    30000 * (w1 + w2 + w3 + w4) + 30 * (I1 + I2 + I3 + I4);

# -- Restricciones -------------------------------------
# Capacidad de produccion: P_t <= 500 * (empleados activos en t)
# Activos en t = todos menos los que tienen t libre
subject to cap_q1: P1 <= 500 * (w2 + w3 + w4);
subject to cap_q2: P2 <= 500 * (w1 + w3 + w4);
subject to cap_q3: P3 <= 500 * (w1 + w2 + w4);
subject to cap_q4: P4 <= 500 * (w1 + w2 + w3);

# Balance de inventario (I0 = 600)
subject to inv_q1: I1 = 600  + P1 - 4000;
subject to inv_q2: I2 = I1   + P2 - 2000;
subject to inv_q3: I3 = I2   + P3 - 3000;
subject to inv_q4: I4 = I3   + P4 - 10000;

# -- Resolver y mostrar resultados ---------------------
option solver cplex;
solve;

display w1, w2, w3, w4;
display P1, P2, P3, P4;
display I1, I2, I3, I4;
display costo_total;
