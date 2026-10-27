% === Ejercicio 1 parte b: Ajuste por Descomposición QR ===

% 1. Datos de entrada (definidos explícitamente como VECTORES COLUMNA 5x1)
x_vals = [-1; 0; 1; 2; 3];
y_vals = [7/2; 3/2; 2; 11/5; 3];

% 2. Construcción de la matriz de diseño A (5x3) para f(x) = a*x^3 + b*x + c
A = [x_vals.^3, x_vals, ones(size(x_vals))];

% 3. Factorización QR reducida (A = Q*R)
[Q, R] = qr(A, 0);

% 4. Cálculo del vector reducido b = Q^T * y
b_vector = Q' * y_vals;

% 5. Resolución del sistema triangular superior R * x = b_vector
res = R \ b_vector;

% Extracción de los parámetros del modelo
a = res(1);
b = res(2);
c = res(3);

% Reporte de resultados
fprintf('=== RESULTADOS DEL AJUSTE POR QR ===\n');
fprintf('a = %10.6f\n', a);
fprintf('b = %10.6f\n', b);
fprintf('c = %10.6f\n', c);
fprintf('\nFunción ajustada: f(x) = %.6f*x^3 + (%.6f)*x + %.6f\n', a, b, c);