% 1. Definición de la grilla en el dominio (-4, 4) x (-4, 4)
x = linspace(-4, 4, 300);
y = linspace(-4, 4, 300);
[X, Y] = meshgrid(x, y);

% 2. Evaluación correcta de las funciones vectoriales F y G
F = X.^2 + X.*(Y.^3) - 9;
G = 3*(X.^2).*Y - Y.^3 - 4;

% 3. Gráfica de las curvas de nivel 0 (f = 0 en rojo, g = 0 en azul)
figure;
contour(X, Y, F, [0 0], 'r', 'LineWidth', 2); hold on;
contour(X, Y, G, [0 0], 'b', 'LineWidth', 2);

% Personalización del gráfico
grid on;
xlabel('x');
ylabel('y');
title('Curvas de nivel 0: f(x,y)=0 (rojo) y g(x,y)=0 (azul)');
legend('f(x,y) = 0', 'g(x,y) = 0', 'Location', 'northeast');
axis([-4 4 -4 4]);