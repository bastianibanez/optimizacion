# Guia de Estudio — Control 1 Optimizacion (AMPL)

40 ejercicios de Winston resueltos en AMPL. Esta guia selecciona los **15 ejercicios clave**
que cubren todos los tipos de problema. Si dominas estos, puedes resolver cualquier variante.

---

## Estrategia de Estudio (4 fases)

### Fase 1: Formulacion Matematica (dia 1-2)
Aprende a formular cualquier problema con la estructura formal: Conjuntos, Variables, Objetivo, Restricciones.

### Fase 2: Traduccion a AMPL (dia 2-3)
Traduce formulaciones matematicas a codigo AMPL (.mod, .dat, .run).

### Fase 3: Patrones (dia 3-4)
Domina cada tipo de problema con un ejercicio representativo.

### Fase 4: Velocidad (dia 5+)
Resuelve ejercicios sin mirar apuntes, cronometrado. Formulacion + AMPL completo.

---

## Fase 1 — Formulacion Matematica

Cada problema del control debe formularse con esta estructura **antes** de escribir codigo:

### Plantilla de formulacion

**1. Conjuntos** — Definir indices y sus dominios
$$i \in \{1, 2, ..., n\}$$
Describir que representa cada indice.

**2. Parametros** — Datos conocidos del problema
- Costos, capacidades, demandas, etc.
- Notacion: letras minusculas con subindices ($c_i$, $d_{ij}$, $b_k$)

**3. Variables de decision** — Lo que queremos determinar
$$x_i \in \mathbb{Z}_{\geq 0} \quad \text{o} \quad x_i \geq 0 \quad \text{o} \quad x_i \in \{0,1\}$$
Segun si es entero, continuo o binario.

**4. Funcion objetivo** — Max o Min
$$\text{Max/Min } Z = \sum_{i} c_i \cdot x_i$$

**5. Restricciones** — Cada una con descripcion
$$\sum_{j} a_{ij} x_j \leq b_i, \quad \forall i$$

**6. Modelo completo** — Todo junto, limpio y listo para revisar.

### Ejemplo: Problema de Panama (visto en clase)

**Conjuntos:** $i \in \{1,2,3,4\}$ (personas)

**Variables:** $x_i, y_i, z_i \in \mathbb{Z}_{\geq 0}$ (televisores, equipos de sonido, aspiradores por persona)

**Objetivo:**
$$\text{Max } Z = 150000\sum_{i=1}^{4}x_i + 90000\sum_{i=1}^{4}y_i + 60000\sum_{i=1}^{4}z_i$$

**Restricciones:**
- Presupuesto: $250000\sum x_i + 180000\sum y_i + 70000\sum z_i \leq 3000000$
- Aduana: $x_i + y_i + z_i \leq 12, \quad \forall i$
- Integridad: $x_i, y_i, z_i \in \mathbb{Z}_{\geq 0}$

### Tabla de traduccion: Matematica → AMPL

| Formulacion matematica | Codigo AMPL |
|------------------------|-------------|
| $i \in \{1,...,n\}$ | `set I;` |
| $c_i$ (dato conocido) | `param c{I};` |
| $x_i \geq 0$ | `var x{I} >= 0;` |
| $x_i \in \mathbb{Z}_{\geq 0}$ | `var x{I} >= 0 integer;` |
| $x_i \in \{0,1\}$ | `var x{I} binary;` |
| $\text{Max } Z = \sum c_i x_i$ | `maximize Z: sum{i in I} c[i]*x[i];` |
| $\sum a_{ij} x_j \leq b_i, \forall i$ | `subject to r{i in I}: sum{j in J} a[i,j]*x[j] <= b[i];` |

---

## Fase 2 — Dominar la Sintaxis AMPL

Antes de resolver ejercicios, asegurate de saber escribir de memoria:

```ampl
# Estructura basica de un .mod
set PRODUCTOS;
set RECURSOS;

param disponible{RECURSOS};
param consumo{RECURSOS, PRODUCTOS};
param ganancia{PRODUCTOS};

var x{PRODUCTOS} >= 0;

maximize beneficio: sum{j in PRODUCTOS} ganancia[j] * x[j];

subject to capacidad{i in RECURSOS}:
    sum{j in PRODUCTOS} consumo[i,j] * x[j] <= disponible[i];
```

```ampl
# Estructura basica de un .dat
set PRODUCTOS := camisas pantalones;
set RECURSOS := tela mano_obra;

param disponible := tela 150 mano_obra 200;

param consumo:        camisas  pantalones :=
      tela            2        3
      mano_obra       4        2;

param ganancia := camisas 10 pantalones 15;
```

```ampl
# Estructura basica de un .run
model archivo.mod;
data archivo.dat;
option solver cplex;
solve;
display x, beneficio;
```

**Checklist de sintaxis:**
- [ ] Declarar `set`, `param`, `var`
- [ ] Indexar con `{i in SET}`
- [ ] Usar `sum{i in SET} expresion`
- [ ] Restricciones con `subject to nombre{indices}: expresion <= valor;`
- [ ] `>=0` en variables, o `integer`, o `binary` segun el caso
- [ ] Separar modelo (.mod) de datos (.dat)

---

## Fase 3 — Un Ejercicio por Tipo de Problema

Para cada tipo: primero formula matematicamente, luego traduce a AMPL.

### Tipo A: LP Basico (produccion/recursos)
> **Ejercicio 27** (Daisy Drugs) — OBLIGATORIO

Maximizar ingreso con 2 productos y restricciones de recursos.

**Patron de formulacion:**
- Conjuntos: $j \in \text{PRODUCTOS}$, $i \in \text{RECURSOS}$
- Variables: $x_j \geq 0$ (cantidad a producir)
- Objetivo: $\text{Max } Z = \sum_j g_j x_j$ (ganancia)
- Restricciones: $\sum_j a_{ij} x_j \leq b_i, \forall i$ (capacidad de recursos)

- Respuesta esperada: $1.200

> **Ejercicio 29** (Chemco) — REFUERZO

Agrega restricciones de residuos y limites de produccion. Mas variables.
- Respuesta esperada: $54.000

---

### Tipo B: Blending / Mezcla
> **Ejercicio 28** (Lizzie's Dairy) — OBLIGATORIO

Mezclar ingredientes para cumplir specs de calidad a minimo costo.

**Patron de formulacion:**
- Conjuntos: $i \in \text{INGREDIENTES}$, $k \in \text{ATRIBUTOS}$
- Variables: $x_i \geq 0$ (cantidad de cada ingrediente)
- Objetivo: $\text{Min } Z = \sum_i c_i x_i$ (costo)
- Restricciones de calidad: $\sum_i q_{ki} x_i \geq (\text{o} \leq) \text{spec}_k \cdot \sum_i x_i$
- Clave: las restricciones de proporcion se linealizan multiplicando ambos lados

- Respuesta esperada: $1.920

> **Ejercicio 36** (Aluminio) — REFUERZO

Mezcla con multiples materias primas y grados de calidad.
- Respuesta esperada: $900.000

---

### Tipo C: Multi-periodo (produccion + inventario)
> **Ejercicio 24** (Steelco) — OBLIGATORIO

Produccion de acero en 3 meses con inventario entre periodos.

**Patron de formulacion:**
- Conjuntos: $t \in \{1,...,T\}$ (periodos)
- Variables: $p_t \geq 0$ (produccion), $I_t \geq 0$ (inventario)
- Objetivo: $\text{Min } Z = \sum_t (c_t^{prod} p_t + c_t^{inv} I_t)$
- Balance de inventario: $I_t = I_{t-1} + p_t - d_t, \quad \forall t$
- Clave: definir $I_0$ como parametro (inventario inicial)

- Respuesta esperada: $58.250

> **Ejercicio 30** (Donovan) — REFUERZO

4 trimestres, misma estructura pero mas periodos.
- Respuesta esperada: $597.000

---

### Tipo D: Transporte / Asignacion
> **Ejercicio 40** (Coalco) — OBLIGATORIO

Minimizar costo de envio desde origenes a destinos.

**Patron de formulacion:**
- Conjuntos: $i \in \text{ORIGENES}$, $j \in \text{DESTINOS}$
- Variables: $x_{ij} \geq 0$ (unidades enviadas de $i$ a $j$)
- Objetivo: $\text{Min } Z = \sum_i \sum_j c_{ij} x_{ij}$
- Oferta: $\sum_j x_{ij} \leq s_i, \quad \forall i$
- Demanda: $\sum_i x_{ij} \geq d_j, \quad \forall j$

- Respuesta esperada: $16.060

> **Ejercicio 18** — REFUERZO

Cubrir demanda al minimo costo con multiples fuentes.
- Respuesta esperada: $464.5

---

### Tipo E: Flujo de caja / Financiero
> **Ejercicio 1** (E.J. gastos mensuales) — OBLIGATORIO

Planificar financiamiento mes a mes manteniendo liquidez.

**Patron de formulacion:**
- Conjuntos: $t \in \text{MESES}$
- Variables: $e_t \geq 0$ (efectivo), $p_t^{corto} \geq 0$ (prestamo corto), $p^{largo} \geq 0$
- Objetivo: $\text{Min } Z = \sum_t r_{corto} \cdot p_t^{corto} + r_{largo} \cdot p^{largo}$
- Balance: $e_t = e_{t-1} + \text{ingresos}_t + p_t^{corto} - \text{gastos}_t$
- Pago largo plazo: $e_T \geq p^{largo}(1 + r_{largo})$

- Respuesta esperada: $400

---

### Tipo F: Inventario (EOQ)
> **Ejercicio 8** (Hospital) — OBLIGATORIO

Determinar cantidad optima de pedido.

**Patron de formulacion:**
- Variables: $Q$ (cantidad de pedido)
- Objetivo: $\text{Min } Z = \frac{D \cdot K}{Q} + \frac{h \cdot Q}{2}$ (costo pedido + costo almacenamiento)
- Nota: modelo no lineal, puede requerir solver no lineal

- Respuesta esperada: $4.394,43

---

### Tipo G: Programacion Entera
> **Ejercicio 15** (Contratacion) — OBLIGATORIO

Variables enteras (no puedes contratar 3.7 empleados).

**Patron de formulacion:**
- Misma estructura que LP pero con: $x_i \in \mathbb{Z}_{\geq 0}$
- Puede incluir variables binarias: $y_i \in \{0,1\}$ para decisiones si/no
- Clave: si hay costos fijos, usar Big-M: $x_i \leq M \cdot y_i$

- Respuesta esperada: $712,2/dia

---

### Tipo H: Programacion No Lineal
> **Ejercicio 37** (Ratings deportivos) — OBLIGATORIO

Minimizar error cuadratico — objetivo cuadratico.

**Patron de formulacion:**
- Variables: $r_j$ (rating de cada equipo)
- Objetivo: $\text{Min } Z = \sum_{(i,j) \in \text{PARTIDOS}} (r_i - r_j - \text{resultado}_{ij})^2$
- Nota: objetivo cuadratico, sin restricciones lineales tipicamente

- Respuesta esperada: 207

---

### Tipo I: Decision bajo Incertidumbre / Utilidad
> **Ejercicio 17** (Utilidad esperada) — OBLIGATORIO

Maximizar utilidad esperada con probabilidades.

**Patron de formulacion:**
- Conjuntos: $s \in \text{ESCENARIOS}$, $j \in \text{ALTERNATIVAS}$
- Parametros: $p_s$ (probabilidad), $u_{js}$ (utilidad)
- Variables: $x_j \geq 0$ (inversion en alternativa $j$)
- Objetivo: $\text{Max } Z = \sum_s p_s \cdot \sum_j u_{js} x_j$

- Respuesta esperada: $9.896

---

### Tipo J: Teoria de Juegos
> **Ejercicio 5** (State vs rival) — OBLIGATORIO

Encontrar estrategia mixta optima formulada como LP.

**Patron de formulacion:**
- Variables: $x_i \geq 0$ (probabilidad de estrategia $i$), $v$ (valor del juego)
- Objetivo: $\text{Max } v$
- Restricciones: $\sum_i a_{ij} x_i \geq v, \quad \forall j$ (columnas del oponente)
- Probabilidades: $\sum_i x_i = 1$

- Respuesta esperada: 1 victoria promedio por encuentro

---

## Fase 4 — Ejercicios de Simulacro

Resuelve estos **sin apuntes**, con limite de tiempo (~25 min cada uno).
Cada ejercicio debe incluir: **formulacion matematica completa + codigo AMPL**.

Proceso por ejercicio:
1. Leer enunciado → identificar conjuntos, parametros, variables
2. Escribir formulacion matematica (5-8 min)
3. Traducir a AMPL .mod + .dat (10-12 min)
4. Verificar coherencia (5 min)

| Orden | Ejercicio | Tipo | Dificultad |
|-------|-----------|------|------------|
| 1 | 27 | LP basico | Facil |
| 2 | 28 | Blending | Facil |
| 3 | 24 | Multi-periodo | Medio |
| 4 | 40 | Transporte | Medio |
| 5 | 15 | Entero | Medio-Dificil |
| 6 | 37 | No lineal | Medio-Dificil |
| 7 | 17 | Estocastico | Dificil |

Si los 7 te salen bien, estas listo.

---

## Errores Comunes en Pruebas

| Error | Como evitarlo |
|-------|---------------|
| Saltarse la formulacion | SIEMPRE formular matematicamente antes de codificar |
| No definir conjuntos | Primer paso: identificar indices y sus dominios |
| Confundir parametros con variables | Parametros = datos conocidos, variables = lo que decides |
| Olvidar `>= 0` en variables | Siempre declarar `var x{S} >= 0` |
| Confundir min con max | Leer bien: costo = minimize, ganancia = maximize |
| No balancear inventario | $I_t = I_{t-1} + p_t - d_t$ siempre |
| Indices mal puestos | Verificar que cada $\sum$ tiene el set correcto |
| No poner `;` al final | Cada declaracion en AMPL termina en `;` |
| Olvidar `subject to` | Las restricciones NECESITAN nombre + `subject to` |
| Poner datos en el .mod | Separar: parametros en .dat, modelo en .mod |
| Olvidar $\forall$ en restricciones | Si aplica a cada $i$, escribir $\forall i$ explicitamente |

---

## Resumen: Los 15 Ejercicios Clave

| Prioridad | Ejercicios | Tipo |
|-----------|-----------|------|
| ALTA (hacer si o si) | 27, 28, 24, 40, 1, 15, 37, 17 | Uno por tipo |
| MEDIA (refuerzo) | 29, 36, 30, 18, 8, 5 | Variantes |
| BAJA (si hay tiempo) | 22, 21, 4 | Los mas dificiles |

**Regla de oro:** si sabes formular restricciones correctamente, el 80% del control esta resuelto.
