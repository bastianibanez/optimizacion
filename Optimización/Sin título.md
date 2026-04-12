Assignation Problem Silvano Martello

|                   | Destinos |       |       |       |       |       |                               |
| ----------------- | -------- | ----- | ----- | ----- | ----- | ----- | ----------------------------- |
| Origen            | PSO      | MDE   | CTG   | CLO   | MZL   | BTA   |                               |
| Planta 1 Cali     | 13150    | 9630  | 19950 | 5000  | 9650  | 15950 | 600                           |
| Planta 2 Medellin | 19950    | 6500  | 19950 | 9630  | 11150 | 15950 | 600                           |
| Almacén Bogotá    | 17150    | 15950 | 19950 | 15950 | 15950 | 7000  | 250                           |
| Demanda           | 280      | 250   | 240   | 170   | 210   | 300   | 1450/1450                     |
|                   |          |       |       |       |       |       | (El problema está balanceado) |
|                   |          |       |       |       |       |       |                               |
Min z = Dij * Xij
Xij: Origen  i1 -> Destino Xij
$$ Min_{x} = D_{ij} \cdot X_{ij} $$
$$X_{ij}\text{ Origen I al destino J}$$
## Problema 1
Cuatro personas viajan a Panamá y disponen de un presupuesto global de 3000000 COP para inversiones.
Hay tres alternativas de inversion en artefactos electricos: Comprar televisores, equipos de sonido y/o aspiradores cuyos precios unitarios son 250000 COP, 180000 COP y 70000 COP
respectivamente. Estos equipos se ventden en el mercado facilmente 400000, COP 270000 y 130000 respectivamente, la aduana no permite que una persona transporte más de 12 artefactos eléctricos

### 1. Conjuntos
$$i \in \lbrace1, 2, 3, 4\rbrace$$
$$\text{donde i representa cada una de las 4 personas} $$
### 2. Variables de decisión
para cada persona i:
- xi = televisores que compra la persona i
- yi = equipos de sonido que compra la persona i
- zi = aspiradores que compra la persona i

$$x_i,y_i,z_i \in z_{\ge0}

$$ 
### 3. Funcion objetivo (maximinar ganancia)
$$\text{Max Z} = 150000\sum_{i=1}^4x_i+90000\sum_{i=1}^4y_i+60000\sum_{i=1}^4z_i $$
### 4. Restricción de presupuesto global
$$250000\sum_{i=1}^4x_i+180000\sum_{i=1}^4y_i+70000\sum_{i=1}^4z_i\leq300000 $$
### 5. Restriccion de aduana por persona
Cada persona puede transportar máximo 12 artefactos
$$x_i + y_i + z_i \leq12$$
$$ \forall i=1,2,3,4$$
### Restricciones de integridad
Cada persona puede transportar máximo 12 artefactos
$$x_i,y_i,z_i\in\mathbb{Z}$$
### Modelo matemático completo

$$\text{Max Z} = 150000\sum_{i=1}^4x_i+90000\sum_{i=1}^4y_i+60000\sum_{i=1}^4z_i $$
Sujeto a:
$$250000\sum_{i=1}^4x_i+180000\sum_{i=1}^4y_i+70000\sum_{i=1}^4z_i\leq300000 $$
$$x_i+y_i+z_i\leq12,\forall i$$
$$x_i,y_i,z_i\in\mathbb{Z}_{\ge0}$$

## Problema 2
### 2.10 Problema de la dieta
Debido a la recesión económica pos Covid-19, usted ha decidido seguir una
dieta estricta y económica que logre aportar el requerimiento mínimo diario
nutricional para sobrevivir, y así ahorrar para empezar un emprendimiento.
Asumiendo que usted es una mujer con actividad física moderada, mayor de
18 años y con un peso de 60 kg, su necesidad nutricional promedio diaria5
sería como se ilustra en la Tabla 2.9.

$$
\begin{bmatrix}
\text{Macronutriente o micronutriente} & \text{Requerimiento mínimo}\\
\hline
\text{Proteina (g/dia)} & 65\\
\text{Lípidos o grasas (g/dia)} & 66\\
\text{Hidratos de carbono (g/día)} & 362\\
\text{Vitamina A (ug/dia)} & 700\\
\text{Vitamina C (mg/dia)} & 75\\
\text{Folato (mg/dia)} & 400\\
\text{Calcio (mg/dia)} & 1000\\
\text{Hierro (mg/dia)} & 18\\

\text{Proteina (g/dia)} & 65\\
\end{bmatrix}
$$