l1 = 1; 
l2 = 1.5;
h = @(g) largo_maximo(l1, l2, g) - 5;

% Puntos iniciales para gamma en rad
g0 = 0.5 * pi; % eleccion por que pi/2 es el codo tradicional de esquina 
g1 = 0.9 * pi;

gamma_min = secante(h, g0, g1, 1e-8);

fprintf('Gamma mínimo: %.4f rad (%.2f°)\n', gamma_min, gamma_min * 180 / pi);