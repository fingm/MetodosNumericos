% 1. Datos originales
t = (1:25)';
y = [ 5.0291  6.5099  5.3666  4.1272  4.2948 ...
      6.1261 12.5140 10.0502  9.1614  7.5677 ...
      7.2920 10.0357 11.0708 13.4045 12.8415 ...
     11.9666 11.0765 11.7774 14.5701 17.0440 ...
     17.0398 15.9069 15.4850 15.5112 17.6572]';

% 2. Identificar y separar el outlier (índice 7: t = 7)
idx_outlier = 7;

t_outlier = t(idx_outlier);
y_outlier = y(idx_outlier);

t_filtrado = t;
y_filtrado = y;
t_filtrado(idx_outlier) = [];
y_filtrado(idx_outlier) = [];

% 3. Ajuste del modelo: y(t) = beta_1 + beta_2*t + beta_3*sin(t)
A_filtrado = [ones(length(t_filtrado), 1), t_filtrado, sin(t_filtrado)];
beta = A_filtrado \ y_filtrado;

% 4. Grilla fina en el intervalo [0, 26]
t_fina = linspace(0, 26, 500)';
A_fina = [ones(length(t_fina), 1), t_fina, sin(t_fina)];
y_fina = A_fina * beta;

% 5. Graficar resultados
figure;
hold on;

% Curva ajustada en la grilla fina
plot(t_fina, y_fina, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Curva ajustada y(t)');

% Datos válidos (marcador 'o')
plot(t_filtrado, y_filtrado, 'bo', 'MarkerFaceColor', 'b', 'DisplayName', 'Datos válidos');

% Valor atípico (marcador '*')
plot(t_outlier, y_outlier, 'r*', 'MarkerSize', 10, 'LineWidth', 2, 'DisplayName', 'Outlier (t=7)');

hold off;
grid on;
xlabel('t');
ylabel('y');
title('Ajuste del modelo y(t) = \beta_1 + \beta_2 t + \beta_3 sin(t) en grilla fina');
legend('Location', 'northwest');