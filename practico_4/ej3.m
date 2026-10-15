

c = [816, -3835, 6000, -3125];
r = roots(c); % Devuelve el vector con las 3 raíces

x = linspace(1.43, 1.71, 1000);
y = 816*x.^3 - 3835*x.^2 + 6000*x - 3125;

plot(x, y, 'b-', 'LineWidth', 2); hold on;
grid on;
plot([1.43, 1.71], [0, 0], 'k--'); % Eje y = 0

% Graficar las tres raíces calculadas con roots:
% r es un vector, y zeros(size(r)) crea ceros para las coordenadas en y
plot(r, zeros(size(r)), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

xlabel('x'); ylabel('p(x)');
title('Polinomio p(x) y sus tres raíces cercanas');
legend('p(x)', 'y = 0', 'Raíces');



