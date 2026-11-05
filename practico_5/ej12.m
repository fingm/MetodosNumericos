% === EJERCICIO 12: Relación Peso - Altura ===
clear; clc;

% Datos del problema
h = [0.912; 0.986; 1.060; 1.130; 1.190; 1.260; 1.320; 1.380; 1.410; 1.490]; % Altura (m)
p = [13.7; 15.9; 18.5; 21.3; 23.5; 27.2; 32.7; 36.0; 38.6; 43.7];          % Peso (kg)

% =========================================================================
% PARTE B: Ajuste Lineal por Ecuaciones Normales (Logaritmizado)
% modelo: ln(p) = ln(c1) + c2 * ln(h)
% =========================================================================
z = log(p);
w = log(h);

% Matriz de diseño (10x2): ojo que la segunda columna es log(h)
A_lin = [ones(length(h), 1), w];

% Ecuaciones Normales
ATA = A_lin' * A_lin;
ATz = A_lin' * z;

u = ATA \ ATz;

C_lin = u(1);
c2_b = u(2);
c1_b = exp(C_lin);

fprintf('=== PARTE B: Ajuste Linealizado (Ecuaciones Normales) ===\n');
fprintf('c1 (linealizado) = %.4f\n', c1_b);
fprintf('c2 (linealizado) = %.4f\n\n', c2_b);


% =========================================================================
% PARTE A: Ajuste No Lineal usando el Método de Gauss-Newton
% modelo: p = c1 * h^(c2)
% =========================================================================
f = @(c1, c2, h) c1 .* (h .^ c2);
J = @(c1, c2, h) [h .^ c2, c1 .* (h .^ c2) .* log(h)];

% Semilla inicial proveniente de la Parte B
param = [c1_b; c2_b]; 

tol = 1e-6;
max_iter = 50;
iter = 0;

while iter < max_iter
    b_res = p - f(param(1), param(2), h);
    A = J(param(1), param(2), h);
    
    d = (A' * A) \ (A' * b_res);
    
    param = param + d;
    iter = iter + 1;
    
    if norm(d) < tol
        break;
    endif
endwhile

c1_a = param(1);
c2_a = param(2);

fprintf('=== PARTE A: Ajuste No Lineal (Gauss-Newton) ===\n');
fprintf('c1 (Gauss-Newton) = %.4f\n', c1_a);
fprintf('c2 (Gauss-Newton) = %.4f\n', c2_a);
fprintf('Número de iteraciones = %d\n', iter);


% =========================================================================
% COMPARACIÓN DE RESIDUOS Y GRÁFICOS
% =========================================================================
hh = linspace(min(h), max(h), 200)';
p_a = f(c1_a, c2_a, hh);
p_b = f(c1_b, c2_b, hh);

figure(1);
plot(h, p, 'ko', 'markersize', 7, 'markerfacecolor', 'k');
hold on;
plot(hh, p_a, 'b-', 'linewidth', 2);
plot(hh, p_b, 'r--', 'linewidth', 2);
xlabel('Altura (m)');
ylabel('Peso (kg)');
title('Ajuste del Modelo de Potencia: p = c1 * h^{c2}');
legend('Datos', 'Gauss-Newton', 'Linealizado', 'location', 'northwest');
grid on;
hold off;

res_a = p - f(c1_a, c2_a, h);
res_b = p - f(c1_b, c2_b, h);

fprintf('\n=== COMPARACIÓN DE RESIDUOS ===\n');
fprintf('Suma de cuadrados Gauss-Newton: %.6f\n', sum(res_a.^2));
fprintf('Suma de cuadrados Linealizado:  %.6f\n', sum(res_b.^2));