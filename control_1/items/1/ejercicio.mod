# -- Conjuntos -----------------------------------------
set P;                        # procesos de produccion
set Q;                        # productos quimicos

# -- Parametros ----------------------------------------
param c {P};                  # costo por hora del proceso p  [USD/h]
param a {Q, P};               # unidades del producto q por hora del proceso p
param d {Q};                  # demanda minima diaria del producto q

# -- Variables -----------------------------------------
var x {P} >= 0;               # horas/dia del proceso p

# -- Funcion objetivo ----------------------------------
minimize Costo:
    sum {p in P} c[p] * x[p];

# -- Restricciones -------------------------------------
subject to Demanda {q in Q}:
    sum {p in P} a[q,p] * x[p] >= d[q];

# -- Datos ---------------------------------------------
data;

set P := 1 2;
set Q := A B C;

param c :=  1 40    2 10;

param a :     1  2 :=
          A   3  1
          B   1  1
          C   1  0 ;

param d :=  A 40   B 15   C 5;

# -- Resolver y mostrar resultados ---------------------
option solver cplex;
solve;

display x;
display Costo;
# x[1] = 5   x[2] = 25   Costo = 450 USD/dia


