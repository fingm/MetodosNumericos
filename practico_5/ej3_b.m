% 1. Datos del problema
t = (1:25)';
y = [ 5.0291  6.5099  5.3666  4.1272  4.2948 ...
      6.1261 12.5140 10.0502  9.1614  7.5677 ...
      7.2920 10.0357 11.0708 13.4045 12.8415 ...
     11.9666 11.0765 11.7774 14.5701 17.0440 ...
     17.0398 15.9069 15.4850 15.5112 17.6572]';

% 2. Eliminación del outlier (índice 7)
idx = 7;

t_filtrado = t;
y_filtrado = y;

t_filtrado(idx) = [];
y_filtrado(idx) = [];

% 3. Nuevo ajuste por mínimos cuadrados
A_filtrado = [ones(length(t_filtrado), 1), t_filtrado];
beta_nuevo = A_filtrado \ y_filtrado; % <-- Corregido: se ajusta contra y_filtrado

% 4. Predicciones y cálculo del residuo
y_est = A_filtrado * beta_nuevo;      % <-- Corregido: uso de * y beta_nuevo
residuos = y_est - y_filtrado;        % <-- Corregido: resta limpia

% 5. Gráfica de residuos frente a t
figure;
stem(t_filtrado, residuos, 'filled');
grid on;
xlabel('t (índice k)');
ylabel('Residuo \hat{y}(t_k) - y_k');
title('Gráfica de los residuos (sin outlier)');