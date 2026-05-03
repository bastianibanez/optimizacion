# Outline para Presentación PPT — Knapsack (Problema #18)

## Contexto general

- **Curso:** Optimización · **NRC:** 7925 · **Sección:** 551
- **Profesor:** Gustavo Esteban Gatica González
- **Integrantes:** Benjamín Huerta · Bastián Ibáñez · Joao Morales
- **Problema asignado:** #18 Knapsack 0-1 (Karp, 1972) — dificultad **Baja** (bonus +0.0)
- **Duración:** 10 min vía Zoom · **Formato sugerido:** 6–8 slides
- **Foco rúbrica Control 2:** Descripción 10% · Implementación 20% · Análisis experimental 20% · Respuesta a preguntas 30% · Entregables 20%
- **Mensaje central:** Knapsack 0-1 es NP-completo en sentido débil; la elección del **algoritmo** (PD vs Fuerza Bruta) pesa más que la elección del **lenguaje**.

---

## Slide 1 — Portada (≈15 s)

**Título:** Problema de la Mochila 0-1 (Knapsack) — Un NP-completo clásico de Karp

**Contenido resumido:**
- Logo institución / curso de Optimización
- Subtítulo: "Modelado, Implementación y Análisis Experimental"
- Integrantes, profesor, NRC/Sección, fecha
- Imagen de fondo: ícono de mochila + ítems con peso/valor

**Notas del orador:** Saludo breve y enmarcar: vamos a contar qué es Knapsack, cómo lo modelamos, por qué es NP-completo y qué encontramos al implementarlo en 3 lenguajes con 2 enfoques.

---

## Slide 2 — El Problema (1 min)

**Título:** ¿Qué es el Knapsack 0-1?

**Contenido resumido (lado izquierdo, texto):**
- **Descripción simple:** dado un conjunto de *n* ítems, cada uno con peso *wᵢ* y valor *vᵢ*, y una mochila con capacidad *C*, escoger qué ítems llevar para **maximizar el valor total** sin exceder la capacidad.
- **Decisión binaria:** cada ítem se incluye (xᵢ=1) o no (xᵢ=0) — no se permiten fracciones.
- **Aplicaciones reales:** logística (carga de camiones), finanzas (selección de carteras), ciberseguridad (selección de contramedidas con presupuesto), corte de materiales, asignación de recursos en SO.

**Contenido resumido (lado derecho, ejemplo visual):**
- Mini-tabla con 4 ítems (peso/valor/ratio), C=10 → solución óptima {1,3,4} con valor 22, peso 10/10.
- Dibujo de mochila con los ítems seleccionados.

**Notas del orador:** Anclar la intuición con el ejemplo pequeño antes de saltar al modelo.

---

## Slide 3 — Modelo Matemático (2 min) ⭐ alta ponderación

**Título:** Formulación ILP (Programación Lineal Entera)

**Contenido resumido (estructurado en bloques):**

- **Conjuntos y parámetros:**
  - N = {1,…,n} ítems
  - wᵢ ∈ ℤ⁺ peso, vᵢ ∈ ℤ⁺ valor, C ∈ ℤ⁺ capacidad
  - K = umbral (sólo versión decisión)

- **Variable de decisión:** xᵢ ∈ {0,1} — 1 si el ítem i se incluye

- **Función objetivo (optimización):**
  $$\max Z = \sum_{i=1}^{n} v_i \cdot x_i$$

- **Restricciones:**
  - Capacidad: Σ wᵢ·xᵢ ≤ C
  - Integridad: xᵢ ∈ {0,1} ∀ i ∈ N

- **Versión de decisión (la NP-completa):** ¿existe S⊆N tal que Σ wᵢ ≤ C y Σ vᵢ ≥ K?

**Notas del orador:** Recalcar que la versión de decisión es la formalmente NP-completa; la de optimización es equivalente para fines prácticos (búsqueda binaria sobre K).

---

## Slide 4 — Complejidad y NP-Completitud (1 min)

**Título:** ¿Por qué Knapsack está en NP-Completo?

**Contenido resumido:**

- **Pertenencia a NP:** dado un certificado S (subconjunto), verificar Σwᵢ ≤ C y Σvᵢ ≥ K toma **O(n)** → polinomial.

- **NP-hardness por reducción:**
  $$\text{3-SAT} \le_p \text{Subset Sum} \le_p \text{Knapsack}$$
  Reducción Subset Sum → Knapsack: tomar wᵢ = vᵢ = aᵢ, C = K = T. Reducción O(n).

- **Pseudo-polinomialidad ⚠️:** la PD corre en O(n·C), pero C puede ser exponencial en su representación binaria. Por eso Knapsack es **NP-completo en sentido débil**.

- **Mini-tabla de relaciones:**

  | Problema | Relación | Complejidad |
  |---|---|---|
  | Subset Sum | wᵢ=vᵢ | NP-C |
  | Partition | caso especial | NP-C |
  | Fractional Knapsack | versión relajada | **P** (greedy) |
  | 0-1 ILP | generaliza Knapsack | NP-C |

**Notas del orador:** Énfasis en la distinción "NP-completo débil" — aclara por qué hay un algoritmo "polinomial" que sigue siendo NP-completo.

---

## Slide 5 — Implementación: Dos Enfoques × Tres Lenguajes (3 min) ⭐

**Título:** Estrategia de implementación

**Contenido resumido (dos columnas):**

**Columna A — Enfoque base: Fuerza Bruta / Backtracking**
- Recursión: para cada ítem, ramificar incluir/no incluir
- Explora los **2ⁿ** subconjuntos posibles
- Complejidad: **O(2ⁿ)**
- Implementado en Python, C++ y Java

**Columna B — Enfoque mejorado: Programación Dinámica (bottom-up)**
- Tabla DP de tamaño (n+1)×(C+1)
- Recurrencia clásica: dp[i][c] = max(dp[i-1][c], dp[i-1][c-wᵢ] + vᵢ)
- Complejidad: **O(n·C)** (pseudo-polinomial)
- Reconstrucción de la solución por backtracking sobre la tabla

**Decisiones relevantes:**
- Misma instancia (n=20, C=50) en los 3 lenguajes para comparabilidad
- Sin librerías que resuelvan el problema (cumple restricción de la pauta)
- Promedio de 3 ejecuciones por configuración

**Visual sugerido:** captura recortada de uno de los códigos (PD en Python o C++) con sintaxis resaltada — sin pegar código completo.

**Notas del orador:** Mencionar que ambos algoritmos llegan al mismo óptimo; la diferencia es de tiempo, no de calidad.

---

## Slide 6 — Resultados Experimentales (2 min) ⭐

**Título:** ¿Cuánto importa el algoritmo? ¿Y el lenguaje?

**Contenido resumido:**

- **Instancia común:** n=20 ítems, C=50 kg, pesos [1–8], valores [3–9]
- **Óptimo encontrado por todos:** $90, 14 ítems, peso 50/50

**Tabla central (la estrella del slide):**

| Lenguaje | Fuerza Bruta O(2ⁿ) | Prog. Dinámica O(n·C) | Speedup PD |
|---|---|---|---|
| Python | 182.65 ms | 0.18 ms | **≈ 996×** |
| C++ | 11.75 ms | 0.05 ms | ≈ 219× |
| Java | 49.29 ms | 0.07 ms | ≈ 706× |

**Gráfico sugerido:** barras agrupadas en escala logarítmica — eje Y log(ms), 3 grupos (Py/C++/Java), 2 barras por grupo (FB vs PD).

**Proyección de escalabilidad (tabla pequeña):**
- n=30: FB Python ≈ 3 min; FB Java ≈ 47 s; FB C++ ≈ 11 s; PD < 0.5 ms
- n=40: FB inviable (>50 h en Python); PD sigue en ~1 ms

**Notas del orador:** "Pasar de FB a PD ahorra hasta 3 órdenes de magnitud. La elección del lenguaje es 10–15×; la del algoritmo, 200–1000×."

---

## Slide 7 — Análisis Crítico y Conclusiones (1 min)

**Título:** ¿Qué nos llevamos de este trabajo?

**Contenido resumido (bullets cortos):**

- **El algoritmo manda:** elegir PD sobre FB importa más que elegir C++ sobre Python.
- **C++ > Java > Python** consistentemente; en PD las diferencias se aplanan (todos < 0.2 ms).
- **Pseudo-polinomialidad en acción:** PD es práctica para C moderado; con C ~ 10⁹ se rompería incluso para n pequeño.
- **Limitaciones de nuestro experimento:**
  - Una sola instancia fija (n=20) — no se exploró variabilidad
  - No se midió memoria, sólo tiempo
  - Falta probar PD optimizada (rolling array O(C) en memoria)
- **Posibles mejoras / extensiones:** branch & bound con bound greedy, Meet-in-the-Middle (O(2^(n/2))), aproximación FPTAS para casos grandes.
- **Aprendizaje clave:** entender NP-completitud no es saber que "es difícil", es entender **cuándo y por qué** un algoritmo "polinomial" no rescata el problema.

**Notas del orador:** Cerrar con una frase recordable — p. ej. "Knapsack es NP-completo, pero con una mochila de tamaño razonable, la PD lo deja casi gratis."

---

## Slide 8 (opcional) — Preguntas / Backup ⭐ (30% rúbrica)

**Título:** ¿Preguntas?

**Contenido resumido:**
- Datos de contacto / repositorio
- **Slides de respaldo escondidos** (no se muestran, pero listos por si preguntan):
  - **Backup A:** pseudocódigo completo de PD con reconstrucción
  - **Backup B:** demostración detallada Subset Sum → Knapsack
  - **Backup C:** memoria de la tabla DP (cuándo usar rolling array)
  - **Backup D:** comparación con Fractional Knapsack (greedy O(n log n))
  - **Backup E:** capturas de los 6 archivos de código (Py/C++/Java × FB/PD)
  - **Backup F:** detalle de la instancia (los 20 ítems con peso/valor)
  - **Backup G:** explicación de por qué Java JIT supera a Python pero no a C++

**Notas del orador:** El 30% de la nota es responder bien — preparar a los 3 integrantes para cualquier sección. Repartir el dominio: uno lidera modelo, otro implementación, otro análisis, pero todos deben poder defender cualquier pregunta.

---

## Recomendaciones de diseño y entrega

- **Distribución de tiempo objetivo:** 0:15 portada · 1:00 problema · 2:00 modelo · 1:00 complejidad · 3:00 implementación · 2:00 resultados · 0:45 conclusiones → 10 min exactos.
- **Repartir voces:** rotar al expositor entre slides para mostrar dominio colectivo (la pauta lo exige).
- **Visual:** plantilla sobria, una sola paleta (azul/gris), tipografía sans-serif, ecuaciones renderizadas (no captura), tablas con filas alternadas.
- **Antes de exponer:** ensayo cronometrado, anticipar 5 preguntas frecuentes (ver backup), revisar que las cifras del informe coincidan con las de la presentación.
- **Entregables paralelos** (rúbrica 20%): informe escrito, código en los 3 lenguajes, casos de prueba y resultados — confirmar que están subidos antes de la presentación.
