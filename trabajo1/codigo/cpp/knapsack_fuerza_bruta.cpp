// Knapsack 0-1 — Enfoque 1: Fuerza Bruta (Backtracking recursivo)
// Complejidad: O(2^n)
// Karp #18 — Curso de Optimizacion
// Compilar: g++ -O2 -std=c++17 knapsack_fuerza_bruta.cpp -o knapsack_fb
#include <iostream>
#include <vector>
#include <chrono>

const std::vector<int> PESOS   = {3, 5, 2, 7, 4, 1, 6, 8, 3, 5, 2, 4, 7, 1, 6, 3, 5, 8, 2, 4};
const std::vector<int> VALORES = {4, 8, 3, 9, 6, 3, 7, 9, 5, 6, 4, 5, 8, 3, 7, 4, 6, 9, 3, 5};
const int CAPACIDAD = 50;

int n;
int mejor_valor;
std::vector<int> mejor_seleccion;
std::vector<int> seleccion_actual;

void backtrack(int i, int peso_actual, int valor_actual) {
    if (i == n) {
        if (valor_actual > mejor_valor) {
            mejor_valor = valor_actual;
            mejor_seleccion = seleccion_actual;
        }
        return;
    }
    // Rama 1: no incluir el item i
    seleccion_actual[i] = 0;
    backtrack(i + 1, peso_actual, valor_actual);
    // Rama 2: incluir el item i (solo si cabe)
    if (peso_actual + PESOS[i] <= CAPACIDAD) {
        seleccion_actual[i] = 1;
        backtrack(i + 1, peso_actual + PESOS[i], valor_actual + VALORES[i]);
        seleccion_actual[i] = 0;
    }
}

int main() {
    n = PESOS.size();
    mejor_valor = 0;
    mejor_seleccion.assign(n, 0);
    seleccion_actual.assign(n, 0);

    auto t0 = std::chrono::high_resolution_clock::now();
    backtrack(0, 0, 0);
    auto t1 = std::chrono::high_resolution_clock::now();
    double ms = std::chrono::duration<double, std::milli>(t1 - t0).count();

    int peso_total = 0;
    for (int i = 0; i < n; ++i) if (mejor_seleccion[i]) peso_total += PESOS[i];

    std::cout << "=== Knapsack 0-1 | Fuerza Bruta ===\n";
    std::cout << "n = " << n << ", C = " << CAPACIDAD << "\n";
    std::cout << "Valor optimo: " << mejor_valor << "\n";
    std::cout << "Peso total:   " << peso_total << "/" << CAPACIDAD << "\n";
    std::cout << "Items (1..n): ";
    for (int i = 0; i < n; ++i) if (mejor_seleccion[i]) std::cout << (i + 1) << " ";
    std::cout << "\nTiempo:       " << ms << " ms\n";
    return 0;
}
