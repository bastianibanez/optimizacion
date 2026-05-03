// Knapsack 0-1 — Enfoque 2: Programacion Dinamica (bottom-up)
// Complejidad: O(n*C) — pseudo-polinomial
// Karp #18 — Curso de Optimizacion
// Compilar: javac KnapsackPD.java
// Ejecutar: java KnapsackPD
public class KnapsackPD {

    static final int[] PESOS   = {3, 5, 2, 7, 4, 1, 6, 8, 3, 5, 2, 4, 7, 1, 6, 3, 5, 8, 2, 4};
    static final int[] VALORES = {4, 8, 3, 9, 6, 3, 7, 9, 5, 6, 4, 5, 8, 3, 7, 4, 6, 9, 3, 5};
    static final int CAPACIDAD = 50;

    public static void main(String[] args) {
        int n = PESOS.length;
        // dp[i][c] = mejor valor usando los primeros i items con capacidad c
        int[][] dp = new int[n + 1][CAPACIDAD + 1];

        long t0 = System.nanoTime();
        for (int i = 1; i <= n; i++) {
            int wi = PESOS[i - 1];
            int vi = VALORES[i - 1];
            for (int c = 0; c <= CAPACIDAD; c++) {
                dp[i][c] = dp[i - 1][c];
                if (wi <= c && dp[i - 1][c - wi] + vi > dp[i][c]) {
                    dp[i][c] = dp[i - 1][c - wi] + vi;
                }
            }
        }

        // Reconstruccion de la seleccion
        int[] seleccion = new int[n];
        int c = CAPACIDAD;
        for (int i = n; i >= 1; i--) {
            if (dp[i][c] != dp[i - 1][c]) {
                seleccion[i - 1] = 1;
                c -= PESOS[i - 1];
            }
        }
        long t1 = System.nanoTime();
        double ms = (t1 - t0) / 1_000_000.0;

        int pesoTotal = 0;
        StringBuilder items = new StringBuilder();
        for (int i = 0; i < n; i++) {
            if (seleccion[i] == 1) {
                pesoTotal += PESOS[i];
                items.append(i + 1).append(" ");
            }
        }

        System.out.println("=== Knapsack 0-1 | Programacion Dinamica ===");
        System.out.println("n = " + n + ", C = " + CAPACIDAD);
        System.out.println("Valor optimo: " + dp[n][CAPACIDAD]);
        System.out.println("Peso total:   " + pesoTotal + "/" + CAPACIDAD);
        System.out.println("Items (1..n): " + items.toString().trim());
        System.out.printf("Tiempo:       %.3f ms%n", ms);
    }
}
