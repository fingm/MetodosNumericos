% Datos
L_objetivo = 3;
gamma = pi / 2;

% Definimos la función f(l1) que debe dar 0
% Para cada l1 candidato, pasamos l1 y l2 = 2*l1 a largo_maximo
f = @(l1_cand) largo_maximo(l1_cand, 2 * l1_cand, gamma) - L_objetivo;

% Puntos iniciales para l1 (estimación física entre 0.1m y 2m)
l1_0 = 0.3;
l1_1 = 1.0;

% Resolvemos l1 con la secante
l1_num = secante(f, l1_0, l1_1, 1e-8);
l2_num = 2 * l1_num;

fprintf('--- Resolución Numérica con Secante ---\n');
fprintf('Ancho pasillo 1 (l1): %.4f m\n', l1_num);
fprintf('Ancho pasillo 2 (l2): %.4f m\n', l2_num);