% === EJERCICIO 10: Concentración de Sustancia ===
clear; clc;

% Datos del problema (8 puntos)
t = [0.5; 1.0; 1.5; 2.0; 2.5; 3.0; 3.5; 4.0];
y = [6.80; 3.00; 1.50; 0.75; 0.48; 0.25; 0.20; 0.15];

% =========================================================================
% PARTE B: Ajuste Lineal por Ecuaciones Normales (Logaritmizado)
% =========================================================================
z = log(y);

% Matriz de diseño (8x2)
A_lin = [ones(length(t), 1), t];

% Sistema de Ecuaciones Normales: (A'*A)*u = A'*z
ATA = A_lin' * A_lin;
ATz = A_lin' * z;

% Resolución directa (1 solo paso)
u = ATA \ ATz;

C_lin = u(1);
x2_b = u(2);
x1_b = exp(C_lin);

fprintf('=== PARTE B: Ajuste Lineal (Ecuaciones Normales) ===\n');
fprintf('x1 (linealizado) = %.4f\n', x1_b);
fprintf('x2 (linealizado) = %.4f\n\n', x2_b);


% =========================================================================
% PARTE A: Ajuste No Lineal usando el Método de Gauss-Newton
% =========================================================================
f = @(x1, x2, t) x1 * exp(x2 * t);
J = @(x1, x2, t) [exp(x2 * t), x1 * t .* exp(x2 * t)];

% Semilla inicial tomada de la Parte B
p = [x1_b; x2_b]; 

tol = 1e-6;
max_iter = 50;
iter = 0;

while iter < max_iter
    b_res = y - f(p(1), p(2), t);
    A = J(p(1), p(2), t);
    
    d = (A' * A) \ (A' * b_res);
    
    p = p + d;
    iter = iter + 1;
    
    if norm(d) < tol
        break;
    endif
endwhile

x1_a = p(1);
x2_a = p(2);

fprintf('=== PARTE A: Ajuste No Lineal (Gauss-Newton) ===\n');
fprintf('x1 (Gauss-Newton) = %.4f\n', x1_a);
fprintf('x2 (Gauss-Newton) = %.4f\n', x2_a);
fprintf('Número de iteraciones = %d\n', iter);

% =========================================================================
% COMPARACION GRAFICA DE LOS DOS METODOS
% =========================================================================

% Evaluamos las funciones en un intervalo continuo
tt = linspace(min(t), max(t), 200)';

% Curva obtenida por Gauss-Newton
y_a = x1_a * exp(x2_a * tt);

% Curva obtenida por ajuste linealizado
y_b = x1_b * exp(x2_b * tt);

figure(1);
plot(t, y, 'ko', 'markersize', 7, 'markerfacecolor', 'k');
hold on;
plot(tt, y_a, 'b-', 'linewidth', 2);
plot(tt, y_b, 'r--', 'linewidth', 2);

xlabel('Tiempo');
ylabel('Concentracion');
title('Comparacion de los ajustes exponenciales');

legend('Datos originales', 'Gauss-Newton', ...
       'Ajuste linealizado', 'location', 'northeast');

grid on;
hold off;


% =========================================================================
% COMPARACION DE RESIDUOS
% =========================================================================

% Predicciones en los puntos originales
pred_a = x1_a * exp(x2_a * t);
pred_b = x1_b * exp(x2_b * t);

% Residuos en escala original
res_a = y - pred_a;
res_b = y - pred_b;

% Sumas de cuadrados
S_a = sum(res_a.^2);
S_b = sum(res_b.^2);

fprintf('\n=== COMPARACION DE RESIDUOS ===\n');
fprintf('Suma de cuadrados Gauss-Newton: %.6f\n', S_a);
fprintf('Suma de cuadrados Linealizado: %.6f\n', S_b);

% Grafico de residuos
figure(2);
plot(t, res_a, 'bo-', 'linewidth', 1.5);
hold on;
plot(t, res_b, 'rs--', 'linewidth', 1.5);
yline(0, 'k-');

xlabel('Tiempo');
ylabel('Residuo');
title('Comparacion de residuos');
legend('Gauss-Newton', 'Linealizado');
grid on;
hold off;

% Se observa que Gauss-Newton proporciona un menor error cuadrático en la escala original. Este comportamiento es esperable, ya que ambos métodos 
% minimizan funciones objetivo diferentes. Gauss-Newton minimiza la suma de los cuadrados de las diferencias entre los valores observados y los valores
% estimados de la concentración. En cambio, el método linealizado minimiza la suma de los cuadrados de las diferencias entre sus logaritmos.
% Aunque la transformación logarítmica conserva la equivalencia algebraica del modelo exponencial, no conserva el criterio de mínimos cuadrados.
% Por lo tanto, los parámetros y los residuos obtenidos mediante ambos procedimientos no tienen por qué coincidir.