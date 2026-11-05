% === EJERCICIO 11 COMPLETO ===
clear; clc; close all;

function [x_res, A, b] = ej11(x, y)
    f = @(x,y) [y^2, x*y, x, y, 1];
    r_fun = @(x) x^2;

    A = zeros(length(x), 5);
    b = zeros(length(x), 1);
    
    for i = 1:length(x)
        A(i,:) = f(x(i), y(i));
        b(i) = r_fun(x(i));
    endfor

    x_res = A \ b;
endfunction

% --- Parte a ---
x = [1.02, 0.95, 0.87, 0.77, 0.67, 0.56, 0.44, 0.30, 0.16, 0.01];
y = [0.39, 0.32, 0.27, 0.22, 0.18, 0.15, 0.13, 0.12, 0.13, 0.15];

[x_a, A, b] = ej11(x, y);

% --- Parte b ---
a_noise = -0.0005;
b_noise =  0.0005;

x_r = zeros(1, length(x));
y_r = zeros(1, length(y));

for i = 1:length(x)
    x_r(i) = x(i) + (a_noise + (b_noise - a_noise) * rand());
    y_r(i) = y(i) + (a_noise + (b_noise - a_noise) * rand());
endfor

x_b = ej11(x_r, y_r);

% --- Parte c: SVD con k = 1,...,5 ---
[U, S, V] = svd(A, 0); % Descomposición SVD reducida
sigma = diag(S);       % Extraer valores singulares (ya ordenados en forma decreciente)

X_k = zeros(5, 5);     % Matriz donde cada columna k es la solución x_k

for k = 1:5
    x_k = zeros(5, 1);
    for i = 1:k
        x_k = x_k + ((U(:,i)' * b) / sigma(i)) * V(:,i);
    endfor
    X_k(:, k) = x_k;
endfor

% --- Gráfico comparativo de la Parte c ---
xmin = -0.1; deltax = 0.005; xmax = 1.1;
ymin =  0.0; deltay = 0.005; ymax = 0.5;

[X, Y] = meshgrid(xmin:deltax:xmax, ymin:deltay:ymax);

figure(2);
plot(x, y, 'ro', 'markerfacecolor', 'r', 'markersize', 6); hold on;

colores = ['r', 'g', 'b', 'c', 'm'];
estilos = {'--', '-.', '-', '--', '-'};

for k = 1:5
    xk = X_k(:, k);
    Z_k = X.^2 - (xk(1)*Y.^2 + xk(2)*X.*Y + xk(3)*X + xk(4)*Y + xk(5));
    contour(X, Y, Z_k, [0 0], [colores(k) estilos{k}], 'linewidth', 1.5);
endfor

xlabel('Eje X'); ylabel('Eje Y');
title('Ajuste de Órbita mediante SVD Truncado (k = 1...5)');
legend('Puntos', 'k=1', 'k=2', 'k=3', 'k=4', 'k=5 (Completo)', 'location', 'northeast');
grid on;
hold off;
