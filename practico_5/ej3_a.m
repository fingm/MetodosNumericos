% 1. Datos del problema
t = (1:25)';
y = [ 5.0291  6.5099  5.3666  4.1272  4.2948 ...
      6.1261 12.5140 10.0502  9.1614  7.5677 ...
      7.2920 10.0357 11.0708 13.4045 12.8415 ...
     11.9666 11.0765 11.7774 14.5701 17.0440 ...
     17.0398 15.9069 15.4850 15.5112 17.6572]';

% 2. Construcción de la matriz de diseño y resolución por mínimos cuadrados
A = [ones(length(t), 1), t];
beta = A \ y;  % beta(1) es beta_1, beta(2) es beta_2

% 3. Predicciones y cálculo del residuo
y_est = A * beta;     % y_est(t_k) = beta_1 + beta_2 * t_k
residuos = y_est - y; % Componentes del residuo

% 4. Gráfica de residuos frente a t
figure;
stem(t, residuos, 'filled'); % stem ayuda a visualizar la magnitud de cada r_k
grid on;
xlabel('t (índice k)');
ylabel('Residuo \hat{y}(t_k) - y_k');
title('Gráfica de los residuos para detectar outliers');