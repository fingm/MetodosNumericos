% Definición del polinomio
f = @(x) 816*x.^3 - 3835*x.^2 + 6000*x - 3125;

% Puntos iniciales
x0 = 1;
x1 = 2;

% Parámetros del método
tol = 1e-6;
maxiter = 10;

% Historial para guardar los valores de x
hist_x = [x0, x1];

% Bucle de la Secante
for k = 2:maxiter
    fx1 = f(x1);
    fx0 = f(x0);
    
    x2 = x1 - fx1 * (x1 - x0) / (fx1 - fx0);
    hist_x(end+1) = x2;
    
    if abs(x2 - x1) < tol
        break;
    end
    
    x0 = x1;
    x1 = x2;
end

% -------------------------------------------------------------
% GRAFICACIÓN DE TODAS LAS SECANTES
% -------------------------------------------------------------
x_grid = linspace(0.8, 3.2, 1000);
y_grid = f(x_grid);

figure;
plot(x_grid, y_grid, 'b-', 'LineWidth', 2); hold on; grid on;
plot([0.8, 3.2], [0, 0], 'k--', 'LineWidth', 1.5); % Eje y = 0

% Graficar las tres raíces exactas
r = roots([816, -3835, 6000, -3125]);
plot(r, zeros(size(r)), 'mo', 'MarkerSize', 8, 'MarkerFaceColor', 'm');

% Paleta de colores para diferenciar las secantes
colores = lines(length(hist_x) - 2);

% Graficar cada recta secante
for i = 1:(length(hist_x) - 2)
    xa = hist_x(i);
    xb = hist_x(i+1);
    xc = hist_x(i+2); % Intersección en el eje x
    
    ya = f(xa);
    yb = f(xb);
    
    % Recta que pasa por (xa, ya) y (xb, yb)
    m = (yb - ya) / (xb - xa);
    y_secante = ya + m * (x_grid - xa);
    
    % Dibujar la línea de la secante
    plot(x_grid, y_secante, '--', 'Color', colores(i,:), 'LineWidth', 1.2, ...
         'DisplayName', sprintf('Secante %d (corta en x_%.0f=%.3f)', i, i+1, xc));
     
    % Marcadores en los puntos de contacto sobre la curva
    plot([xa, xb], [ya, yb], 'o', 'Color', colores(i,:), 'MarkerFaceColor', colores(i,:), 'MarkerSize', 5, 'HandleVisibility', 'off');
    
    % Marcador del corte con el eje x
    plot(xc, 0, 'x', 'Color', colores(i,:), 'MarkerSize', 8, 'LineWidth', 2, 'HandleVisibility', 'off');
end

xlabel('x'); ylabel('p(x)');
title('Método de la Secante: Todas las iteraciones');
legend('p(x)', 'Eje y=0', 'Raíces exactas', 'location', 'northeast');
xlim([0.8, 3.2]);
ylim([-300, 500]);