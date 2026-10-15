clear; clc; clf;

% 1. DATOS DEL PROBLEMA
x = [0 2 3];
y = [0 1 2];
d0_val = 0; % f'(0) = 0
dn_val = 0; % f'(3) = 0

n = length(x) - 1;

% 2. PASOS (h) Y PENDIENTES (delta)
h = diff(x);
delta = diff(y) ./ h;

% 3. CONSTRUCCIÓN GENÉRICA DE LA MATRIZ A Y EL VECTOR b (A*d = b)
A = zeros(n+1, n+1);
b = zeros(n+1, 1);

% Borde izquierdo: d_0 = d0_val
A(1, 1) = 1;
b(1) = d0_val;

% Borde derecho: d_n = dn_val
A(n+1, n+1) = 1;
b(n+1) = dn_val;

% Nodos interiores j = 1, ..., n-1 (Ecuación 3.26 del teórico)
for j = 1:(n-1)
    % Índices en Octave (1-based):
    % d_{j-1} -> col j, d_j -> col j+1, d_{j+1} -> col j+2
    A(j+1, j)     = h(j+1);
    A(j+1, j+1)   = 2 * (h(j) + h(j+1));
    A(j+1, j+2)   = h(j);
    
    b(j+1) = 3 * h(j+1) * delta(j) + 3 * h(j) * delta(j+1);
end

% 4. RESOLVER EL SISTEMA PARA HALLAR LAS DERIVADAS d
d = A \ b;

disp('Derivadas halladas en los nodos (d):');
disp(d);

% 5. EVALUACIÓN Y GRÁFICO DE TU MÉTODO (Fórmula 3.21)
xx = linspace(x(1), x(end), 200);
yy_mi_metodo = zeros(size(xx));

for k = 1:length(xx)
    xk = xx(k);
    
    % Determinar en qué subintervalo cae xk
    i = find(x(1:end-1) <= xk & xk <= x(2:end), 1, 'last');
    if isempty(i)
        if xk < x(1), i = 1; else i = n; end
    end
    
    s = xk - x(i);
    hi = h(i);
    
    % Aplicar la fórmula (3.21) del teórico
    term1 = ((hi - s)^2 * (hi + 2*s) / hi^3) * y(i);
    term2 = (s^2 * (3*hi - 2*s) / hi^3) * y(i+1);
    term3 = (s * (hi - s)^2 / hi^2) * d(i);
    term4 = (-s^2 * (hi - s) / hi^2) * d(i+1);
    
    yy_mi_metodo(k) = term1 + term2 + term3 + term4;
end

% 6. SPLINE NATIVO DE OCTAVE PARA COMPARAR
y_ext = [d0_val, y, dn_val]; % Agregamos derivadas en los extremos
sc = spline(x, y_ext);
yy_octave = ppval(sc, xx);

% 7. GRAFICAR Y COMPARAR
plot(xx, yy_mi_metodo, 'b-', 'LineWidth', 2, 'DisplayName', 'Mi método (3.26)');
hold on;
plot(xx, yy_octave, 'r--', 'LineWidth', 2, 'DisplayName', 'Octave spline()');
plot(x, y, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8, 'DisplayName', 'Nodos (x_i, y_i)');
grid on;
legend('Location', 'northwest');
title('Comparación de Spline Cúbica');
xlabel('x'); ylabel('f(x)');

% Diferencia máxima entre ambas soluciones
diff_max = max(abs(yy_mi_metodo - yy_octave));
fprintf('Diferencia máxima entre ambos métodos: %e\n', diff_max);