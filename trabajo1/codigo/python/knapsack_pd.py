"""
Knapsack 0-1 — Enfoque 2: Programacion Dinamica (bottom-up)
Complejidad: O(n*C) — pseudo-polinomial
Karp #18 — Curso de Optimizacion
"""
import time

# Instancia comun (n=20, C=50)
PESOS   = [3, 5, 2, 7, 4, 1, 6, 8, 3, 5, 2, 4, 7, 1, 6, 3, 5, 8, 2, 4]
VALORES = [4, 8, 3, 9, 6, 3, 7, 9, 5, 6, 4, 5, 8, 3, 7, 4, 6, 9, 3, 5]
CAPACIDAD = 50


def knapsack_pd(pesos, valores, capacidad):
    n = len(pesos)
    # dp[i][c] = mejor valor usando los primeros i items con capacidad c
    dp = [[0] * (capacidad + 1) for _ in range(n + 1)]

    for i in range(1, n + 1):
        wi, vi = pesos[i - 1], valores[i - 1]
        for c in range(capacidad + 1):
            dp[i][c] = dp[i - 1][c]
            if wi <= c and dp[i - 1][c - wi] + vi > dp[i][c]:
                dp[i][c] = dp[i - 1][c - wi] + vi

    # Reconstruccion de la seleccion
    seleccion = [0] * n
    c = capacidad
    for i in range(n, 0, -1):
        if dp[i][c] != dp[i - 1][c]:
            seleccion[i - 1] = 1
            c -= pesos[i - 1]

    return dp[n][capacidad], seleccion


def main():
    t0 = time.perf_counter()
    valor_opt, seleccion = knapsack_pd(PESOS, VALORES, CAPACIDAD)
    t1 = time.perf_counter()

    peso_total = sum(PESOS[i] for i in range(len(PESOS)) if seleccion[i])
    items = [i + 1 for i in range(len(seleccion)) if seleccion[i]]

    print("=== Knapsack 0-1 | Programacion Dinamica ===")
    print(f"n = {len(PESOS)}, C = {CAPACIDAD}")
    print(f"Valor optimo: {valor_opt}")
    print(f"Peso total:   {peso_total}/{CAPACIDAD}")
    print(f"Items (1..n): {items}")
    print(f"Tiempo:       {(t1 - t0) * 1000:.3f} ms")


if __name__ == "__main__":
    main()
