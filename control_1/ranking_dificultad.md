# Ranking de Ejercicios por Dificultad

Basado en los 40 ejercicios de "Operational Research" (Winston) resueltos en AMPL.

## Facil — LP directo, pocas variables/restricciones

| # | Tema | Por que es facil |
|---|------|-----------------|
| 27 | Produccion (Daisy Drugs) | 2 variables, restricciones de recursos lineales |
| 28 | Mezcla (Lizzie's Dairy) | 2 productos, restricciones de grasa/materia prima |
| 33 | Produccion (Turkeyco) | Cortes de pavo, LP simple |
| 31 | Amortizacion de prestamo | Formula financiera directa |
| 11 | Rentabilidad de impresion | Analisis de costo-beneficio simple |
| 6 | Inventario (botellas) | EOQ basico, una variable |
| 10 | Inventario (580 uds) | EOQ basico |

## Medio-Facil — LP con mas estructura

| # | Tema | Complejidad |
|---|------|-------------|
| 8 | Inventario (hospital) | EOQ con restriccion de pedido minimo |
| 9 | Produccion en lotes | EOQ con costos de setup |
| 18 | Transporte/asignacion | LP con multiples origenes/destinos |
| 36 | Mezcla (aluminio) | Blending con varias materias primas |
| 32 | Mezcla (papel reciclado) | Blending multi-proceso |
| 2 | Refineria (crudo) | Blending pero la solucion trivial (no producir) indica costos > ingresos |
| 13 | Ahorro impuestos | Optimizacion simple con valor esperado |

## Medio — LP multi-periodo o con indices

| # | Tema | Complejidad |
|---|------|-------------|
| 1 | Flujo de caja mensual | Multi-periodo, restricciones de liquidez por mes |
| 19 | Produccion (Gandhi Clothing) | 2 productos x 2 meses, tela + capacidad |
| 24 | Produccion acero (Steelco) | Multi-periodo con inventario |
| 25 | Formularios impuestos | 5 semanas, asignacion de trabajadores |
| 26 | Procesamiento cheques (Bank One) | Contratacion + procesamiento multi-periodo |
| 30 | Produccion (Donovan) | 4 trimestres, produccion + inventario |
| 29 | Produccion (Chemco) | Restricciones de residuos + materia prima + tiempo |
| 3 | Portafolio de monedas | Multiples monedas con minimos requeridos |
| 40 | Transporte (Coalco) | Red de distribucion multi-cliente |
| 34 | Ubicacion (camion bomberos) | Minimizar distancia ponderada |

## Medio-Dificil — Modelos no lineales, enteros o estocasticos

| # | Tema | Complejidad |
|---|------|-------------|
| 14 | Capacidad de planta (8000 uds) | Programacion entera, decision de capacidad |
| 15 | Contratacion empleados | Entero + demanda estocastica |
| 16 | Inventario estocastico | Valor esperado con demanda aleatoria |
| 20 | Seguros (Payoff Insurance) | Modelar primas con probabilidades |
| 35 | Multi-periodo (Ghostbusters) | 3 meses, multiples restricciones |
| 23 | Asignacion de costos | Asignacion justa entre divisiones, no trivial |
| 37 | Ajuste de ratings (min cuadrados) | Objetivo cuadratico — programacion no lineal |
| 5 | Teoria de juegos | Estrategia mixta optima, formulacion como LP |

## Dificil — Modelos complejos, multiples conceptos

| # | Tema | Complejidad |
|---|------|-------------|
| 4 | Utilidad esperada (riesgo) | Funcion de utilidad no lineal + valor esperado |
| 12 | Clases de parto (olvido) | Optimizacion con funcion de decaimiento exponencial |
| 17 | Utilidad esperada maxima | Arbol de decision + utilidad |
| 21 | Construccion represa | Estocastico multi-etapa, costos de movimiento de tierra |
| 22 | Pricing dinamico (3 anos) | Programacion dinamica, transicion de estados |
| 38 | Utilidad esperada negocio | Decision bajo incertidumbre con utilidad |
| 7 | Minimizar basura (2.91 ton) | Optimizacion de recursos con restricciones no obvias |
| 39 | Costo banco (arriendo maquina) | Modelar colas/tiempos en sistema + costos fijos |

## Resumen

| Nivel | Ejercicios | Cantidad |
|-------|-----------|----------|
| Facil | 6, 10, 11, 27, 28, 31, 33 | 7 |
| Medio-Facil | 2, 8, 9, 13, 18, 32, 36 | 7 |
| Medio | 1, 3, 19, 24, 25, 26, 29, 30, 34, 40 | 10 |
| Medio-Dificil | 5, 14, 15, 16, 20, 23, 35, 37 | 8 |
| Dificil | 4, 7, 12, 17, 21, 22, 38, 39 | 8 |
