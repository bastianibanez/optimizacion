# Problema de optimización / programación lineal

## Enunciado

Un centro de reciclaje industrial utiliza dos chatarras de aluminio, A y B, para
producir una aleación especial. La chatarra A contiene 6% de aluminio, 3% de
silicio, y 4% de carbón. La chatarra B contiene 3% de aluminio, 6% de silicio,
y 3% de carbón. Los costos por tonelada de las chatarras A y B son de $100 y
$80, respectivamente. Las especificaciones de la aleación especial requieren
que (1) el contenido de aluminio debe ser mínimo de 3% y máximo de 6%; (2)
el contenido de silicio debe ser de entre 3 y 5%, y (3) el contenido de carbón
debe ser de entre 3 y 7%. Determine la mezcla óptima de las chatarras que deben
usarse para producir 1000 toneladas de la aleación.

## Conjuntos

- I: {A, B}: Tipo de chatarra i ∈ I
- Q: {1,2,3}: Elemento q ∈ Q

## Parametros

- nij: Proporcion del elemento j ∈ Q en el tipo de chatarra i ∈ I
- ci: Costo por tonelada del tipo de chatarra i ∈ I
- djmin: Proporción mínima del elemento j ∈ Q en la aleación
- djmax: Proporción máxima del elemento j ∈ Q en la aleación
- u: toneladas a producir de la aleación

## Variables de decisión

Xi: Toneladas a utlilizar de chatarra tipo i ∈ I en la aleación

## Modelo Matemático

min z: sum_{i ∈ I} Xi*ci
s.a. sum_{i ∈ I} Xi * nij >= djmin * u,  ∀ j ∈ Q
s.a. sum_{i ∈ I} Xi * nij <= djmax * u,  ∀ j ∈ Q
s.a. sum_{i ∈ I} Xi = u
s.a. Xi >= 0, ∀ i ∈ I

---

Verifica mi solución hasta modelo matemático


