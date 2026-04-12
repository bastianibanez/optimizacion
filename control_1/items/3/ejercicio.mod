# Refinería Melrose
# Maximizar utilidades de producción de gasolina y fuel oil

# Variables de procesamiento (barriles de crudo por método)
var x1 >= 0;  # método 1
var x2 >= 0;  # método 2
var x3 >= 0;  # método 3

# Variables de cracking catalítico
var f6 >= 0;  # barriles grado 6 crackeados a grado 8
var f8 >= 0;  # barriles grado 8 crackeados a grado 10

# Barriles de cada grado destinados a gasolina
var g6 >= 0;
var g8 >= 0;
var g10 >= 0;

# Barriles de cada grado destinados a fuel oil
var o6 >= 0;
var o8 >= 0;
var o10 >= 0;

# Barriles de cada grado descartados
var d6 >= 0;
var d8 >= 0;
var d10 >= 0;

# Función objetivo: maximizar utilidades
maximize profit:
    8 * (g6 + g8 + g10) + 6 * (o6 + o8 + o10)
    - 3.4 * x1 - 3.0 * x2 - 2.6 * x3
    - 1.3 * f6 - 2.0 * f8
    - 0.2 * (d6 + d8 + d10);

# Balance de grado 6
subject to balance_grade6:
    g6 + o6 + d6 = 0.2 * x1 + 0.3 * x2 + 0.4 * x3 - f6;

# Balance de grado 8
subject to balance_grade8:
    g8 + o8 + d8 = 0.2 * x1 + 0.3 * x2 + 0.4 * x3 + f6 - f8;

# Balance de grado 10
subject to balance_grade10:
    g10 + o10 + d10 = 0.6 * x1 + 0.4 * x2 + 0.2 * x3 + f8;

# Calidad gasolina: grado promedio >= 9 (linealizado)
subject to quality_gasoline:
    -3 * g6 - g8 + g10 >= 0;

# Calidad fuel oil: grado promedio >= 7 (linealizado)
subject to quality_fueloil:
    -o6 + o8 + 3 * o10 >= 0;

# Capacidad máxima gasolina
subject to cap_gasoline:
    g6 + g8 + g10 <= 2000;

# Capacidad máxima fuel oil
subject to cap_fueloil:
    o6 + o8 + o10 <= 600;

option solver cplex;
solve;

display x1, x2, x3;
display f6, f8;
display g6, g8, g10;
display o6, o8, o10;
display d6, d8, d10;
display profit;
