set STATES = 0..2; 
set ACTIONS = 0..1; 

param MarketTransitionProb {s in STATES, sp in STATES};

param C {s in STATES, a in ACTIONS};

var g;

var y {s in STATES, a in ACTIONS} >= 0;

minimize TotalCost:
   sum {s in STATES, a in ACTIONS} C[s, a] * y[s, a];

subject to FlowConservation {sp in STATES}:
   sum {a_prime in ACTIONS} y[sp, a_prime] = sum {s in STATES, a in ACTIONS} y[s, a] * MarketTransitionProb[s, sp];

subject to SumToOne:
   sum {s in STATES, a in ACTIONS} y[s, a] = 1;