# Encuesta telefónica
# Minimizar costo de llamadas diurnas y nocturnas para alcanzar cuotas de encuestados

var xD >= 0;  # llamadas diurnas
var xN >= 0;  # llamadas nocturnas

minimize costo: 2*xD + 5*xN;

# Restricciones de cuota mínima por tipo de persona
subject to esposas:        0.30*xD + 0.30*xN >= 150;
subject to esposos:        0.10*xD + 0.30*xN >= 120;
subject to varones_solt:   0.10*xD + 0.15*xN >= 100;
subject to mujeres_solt:   0.10*xD + 0.20*xN >= 110;

# A lo más la mitad de las llamadas pueden ser nocturnas
subject to limite_noche:   xN <= xD;

option solver cplex;
solve;
display xD, xN, costo;
