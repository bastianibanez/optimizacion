// Knapsack 0-1 — Enfoque 2: Programacion Dinamica (bottom-up)
// Complejidad: O(n*C) — pseudo-polinomial
// Karp #18 — Curso de Optimizacion
// Compilar: g++ -O2 -std=c++17 knapsack_pd.cpp -o knapsack_pd
#include <iostream>
#include <vector>
#include <chrono>

const std::vector<int> PESOS   = {3, 5, 2, 7, 4, 1, 6, 8, 3, 5, 2, 4, 7, 1, 6, 3, 5, 8, 2, 4};
const std::vector<int> VALORES = {4, 8, 3, 9, 6, 3, 7, 9, 5, 6, 4, 5, 8, 3, 7, 4, 6, 9, 3, 5};
const int CAPACIDAD = 50;

int main() {
    int n = PESOS.size();
    // dp[i][c] = mejor valor usando los primeros i items con capacidad c
    std::vector<std::vector<int>> dp(n + 1, std::vector<int>(CAPACIDAD + 1, 0));

    auto t0 = std::chrono::high_resolution_clock::now();
    for (int i = 1; i <= n; ++i) {
        int wi = PESOS[i - 1], vi = VALORES[i - 1];
        for (int c = 0; c <= CAPACIDAD; ++c) {
            dp[i][c] = dp[i - 1][c];
            if (wi <= c && dp[i - 1][c - wi] + vi > dp[i][c]) {
                dp[i][c] = dp[i - 1][c - wi] + vi;
            }
        }
    }

    // Reconstruccion de la seleccion
    std::vector<int> seleccion(n, 0);
    int c = CAPACIDAD;
    for (int i = n; i >= 1; --i) {
        if (dp[i][c] != dp[i - 1][c]) {
            seleccion[i - 1] = 1;
            c -= PESOS[i - 1];
        }
    }
    auto t1 = std::chrono::high_resolution_clock::now();
    double ms = std::chrono::duration<double, std::milli>(t1 - t0).count();

    int peso_total = 0;
    for (int i = 0; i < n; ++i) if (seleccion[i]) peso_total += PESOS[i];

    std::cout << "=== Knapsack 0-1 | Programacion Dinamica ===\n";
    std::cout << "n = " << n << ", C = " << CAPACIDAD << "\n";
    std::cout << "Valor optimo: " << dp[n][CAPACIDAD] << "\n";
    std::cout << "Peso total:   " << peso_total << "/" << CAPACIDAD << "\n";
    std::cout << "Items (1..n): ";
    for (int i = 0; i < n; ++i) if (seleccion[i]) std::cout << (i + 1) << " ";
    std::cout << "\nTiempo:       " << ms << " ms\n";
    return 0;
}
