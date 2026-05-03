// Knapsack 0-1 — Enfoque 1: Fuerza Bruta (Backtracking recursivo)
// Complejidad: O(2^n)
// Karp #18 — Curso de Optimizacion
// Compilar: javac KnapsackFuerzaBruta.java
// Ejecutar: java KnapsackFuerzaBruta
public class KnapsackFuerzaBruta {

    static final int[] PESOS   = {3, 5, 2, 7, 4, 1, 6, 8, 3, 5, 2, 4, 7, 1, 6, 3, 5, 8, 2, 4};
    static final int[] VALORES = {4, 8, 3, 9, 6, 3, 7, 9, 5, 6, 4, 5, 8, 3, 7, 4, 6, 9, 3, 5};
    static final int CAPACIDAD = 50;

    static int n;
    static int mejorValor;
    static int[] mejorSeleccion;
    static int[] seleccionActual;

    static void backtrack(int i, int pesoActual, int valorActual) {
        if (i == n) {
            if (valorActual > mejorValor) {
                mejorValor = valorActual;
                System.arraycopy(seleccionActual, 0, mejorSeleccion, 0, n);
            }
            return;
        }
        // Rama 1: no incluir el item i
        seleccionActual[i] = 0;
        backtrack(i + 1, pesoActual, valorActual);
        // Rama 2: incluir el item i (solo si cabe)
        if (pesoActual + PESOS[i] <= CAPACIDAD) {
            seleccionActual[i] = 1;
            backtrack(i + 1, pesoActual + PESOS[i], valorActual + VALORES[i]);
            seleccionActual[i] = 0;
        }
    }

    public static void main(String[] args) {
        n = PESOS.length;
        mejorValor = 0;
        mejorSeleccion = new int[n];
        seleccionActual = new int[n];

        long t0 = System.nanoTime();
        backtrack(0, 0, 0);
        long t1 = System.nanoTime();
        double ms = (t1 - t0) / 1_000_000.0;

        int pesoTotal = 0;
        StringBuilder items = new StringBuilder();
        for (int i = 0; i < n; i++) {
            if (mejorSeleccion[i] == 1) {
                pesoTotal += PESOS[i];
                items.append(i + 1).append(" ");
            }
        }

        System.out.println("=== Knapsack 0-1 | Fuerza Bruta ===");
        System.out.println("n = " + n + ", C = " + CAPACIDAD);
        System.out.println("Valor optimo: " + mejorValor);
        System.out.println("Peso total:   " + pesoTotal + "/" + CAPACIDAD);
        System.out.println("Items (1..n): " + items.toString().trim());
        System.out.printf("Tiempo:       %.3f ms%n", ms);
    }
}
