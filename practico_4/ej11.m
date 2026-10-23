% Script de pruebas comparativas
x0 = 1.5;
tol = 1e-8;
alphas = [0, 1, 1.5, 2];

fprintf('=== METODO ACOPLADO (alpha, x) vs ITERACION PARTE B ===\n');
fprintf('x0 fijo = %.2f | Tolerancia = %.1e\n\n', x0, tol);

for i = 1:length(alphas)
    a0 = alphas(i);
    [x_sol, a_sol, k_iter] = ej_11_punto_fijo_alfa(x0, a0, tol);
    fprintf('alpha0 = %4.1f  --> Iteraciones: %2d  | x* ~ %.8f  | alpha* ~ %.8f\n', ...
            a0, k_iter, x_sol, a_sol);
end

% Comparación con la iteración simple de la Parte b: x_{k+1} = exp(x_k/4)
x_b = x0;
k_b = 0;
while true
    k_b = k_b + 1;
    x_b_next = exp(x_b / 4);
    if abs(x_b_next - x_b) < tol
        break;
    end
    x_b = x_b_next;
end

fprintf('\n--- PARTE B (Iteración simple x_{k+1} = exp(x_k/4)) ---\n');
fprintf('Iteraciones necesarias: %d  | x* ~ %.8f\n', k_b, x_b);