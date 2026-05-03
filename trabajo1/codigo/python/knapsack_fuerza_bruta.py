"""
Knapsack 0-1 — Enfoque 1: Fuerza Bruta (Backtracking recursivo)
Complejidad: O(2^n)
Karp #18 — Curso de Optimización
"""
import time

# Instancia comun (n=20, C=50)
PESOS   = [3, 5, 2, 7, 4, 1, 6, 8, 3, 5, 2, 4, 7, 1, 6, 3, 5, 8, 2, 4]
VALORES = [4, 8, 3, 9, 6, 3, 7, 9, 5, 6, 4, 5, 8, 3, 7, 4, 6, 9, 3, 5]
CAPACIDAD = 50


def knapsack_fb(pesos, valores, capacidad):
    n = len(pesos)
    mejor = {"valor": 0, "seleccion": [0] * n}

    def backtrack(i, peso_actual, valor_actual, seleccion):
        if i == n:
            if valor_actual > mejor["valor"]:
                mejor["valor"] = valor_actual
                mejor["seleccion"] = seleccion[:]
            return
        # Rama 1: no incluir el item i
        seleccion[i] = 0
        backtrack(i + 1, peso_actual, valor_actual, seleccion)
        # Rama 2: incluir el item i (solo si cabe)
        if peso_actual + pesos[i] <= capacidad:
            seleccion[i] = 1
            backtrack(i + 1, peso_actual + pesos[i], valor_actual + valores[i], seleccion)
            seleccion[i] = 0

    backtrack(0, 0, 0, [0] * n)
    return mejor["valor"], mejor["seleccion"]


def main():
    t0 = time.perf_counter()
    valor_opt, seleccion = knapsack_fb(PESOS, VALORES, CAPACIDAD)
    t1 = time.perf_counter()

    peso_total = sum(PESOS[i] for i in range(len(PESOS)) if seleccion[i])
    items = [i + 1 for i in range(len(seleccion)) if seleccion[i]]

    print("=== Knapsack 0-1 | Fuerza Bruta ===")
    print(f"n = {len(PESOS)}, C = {CAPACIDAD}")
    print(f"Valor optimo: {valor_opt}")
    print(f"Peso total:   {peso_total}/{CAPACIDAD}")
    print(f"Items (1..n): {items}")
    print(f"Tiempo:       {(t1 - t0) * 1000:.3f} ms")


if __name__ == "__main__":
    main()
