# Problema de Panama — Explicacion detallada

## Contexto

4 personas viajan a Panama a comprar electronicos para revenderlos en Colombia. El negocio es simple: compran barato alla y venden mas caro aca.

| Artefacto | Precio compra | Precio venta | **Ganancia unitaria** |
|-----------|--------------|--------------|----------------------|
| Televisor | 250.000 | 400.000 | **150.000** |
| Equipo sonido | 180.000 | 270.000 | **90.000** |
| Aspirador | 70.000 | 130.000 | **60.000** |

Las limitaciones son:
- **Presupuesto total:** 3.000.000 COP entre los 4
- **Aduana:** maximo 12 artefactos **por persona**

---

## Modelado paso a paso

### 1. Conjuntos — Quienes deciden?

$$i \in \{1,2,3,4\}$$

Cada persona es un indice. Se necesita porque la restriccion de aduana aplica **a cada una individualmente**.

### 2. Variables — Que decidimos?

Para cada persona $i$: cuantos televisores ($x_i$), equipos de sonido ($y_i$) y aspiradores ($z_i$) compra. Son enteras porque no puedes comprar 2.7 televisores.

$$x_i, y_i, z_i \in \mathbb{Z}_{\geq 0}$$

### 3. Objetivo — Que queremos?

Maximizar la ganancia total. La ganancia es `precio_venta - precio_compra` por cada unidad:

$$\text{Max } Z = 150000\sum_{i=1}^{4}x_i + 90000\sum_{i=1}^{4}y_i + 60000\sum_{i=1}^{4}z_i$$

Las sumatorias $\sum_{i=1}^{4}$ suman lo de las 4 personas, porque la ganancia total es de todos juntos.

### 4. Restriccion de presupuesto — El dinero es compartido

$$250000\sum_{i=1}^{4}x_i + 180000\sum_{i=1}^{4}y_i + 70000\sum_{i=1}^{4}z_i \leq 3\,000\,000$$

Se usa $\sum$ porque el presupuesto es **global** (los 4 comparten la plata). No importa quien compra que, el total no puede superar 3M.

### 5. Restriccion de aduana — Individual por persona

$$x_i + y_i + z_i \leq 12, \quad \forall i = 1,2,3,4$$

**NO** hay sumatoria porque aplica a **cada persona por separado**. El $\forall i$ genera 4 restricciones distintas:
- Persona 1: $x_1 + y_1 + z_1 \leq 12$
- Persona 2: $x_2 + y_2 + z_2 \leq 12$
- Persona 3: $x_3 + y_3 + z_3 \leq 12$
- Persona 4: $x_4 + y_4 + z_4 \leq 12$

### 6. Restricciones de integridad

$$x_i, y_i, z_i \in \mathbb{Z}_{\geq 0}$$

---

## Modelo matematico completo

$$\text{Max } Z = 150000\sum_{i=1}^{4}x_i + 90000\sum_{i=1}^{4}y_i + 60000\sum_{i=1}^{4}z_i$$

Sujeto a:

$$250000\sum_{i=1}^{4}x_i + 180000\sum_{i=1}^{4}y_i + 70000\sum_{i=1}^{4}z_i \leq 3\,000\,000$$

$$x_i + y_i + z_i \leq 12, \quad \forall i = 1,2,3,4$$

$$x_i, y_i, z_i \in \mathbb{Z}_{\geq 0}$$

---

## Intuicion clave

Este problema tiene una distincion fundamental:

| Restriccion | Alcance | Se usa $\sum_i$? | Por que |
|-------------|---------|-----------------|---------|
| Presupuesto | Global (compartido) | **Si** | Los 4 comparten la plata |
| Aduana | Individual (por persona) | **No** ($\forall i$) | Cada uno pasa solo por la aduana |

Esa diferencia entre restricciones **globales** (con $\sum$) y **por indice** (con $\forall$) es un patron que aparece en muchos problemas.

## Observacion sobre la estructura

En este problema particular, como la ganancia y el presupuesto solo dependen del **total** comprado (no de quien compra que), las personas son intercambiables. La solucion optima simplemente reparte los 12 artefactos por persona de forma que maximice ganancia sin pasarse del presupuesto global. Pero el modelado con indice $i$ es necesario porque la restriccion de aduana si distingue entre personas.
