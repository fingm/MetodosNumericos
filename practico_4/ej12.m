% === ARCHIVO: ej12.m ===

% 1. Definición correcta del sistema vectorial y su Jacobiana
f = @(v) [v(1)^2 + v(1)*(v(2)^3) - 9; ...
          3*(v(1)^2)*v(2) - v(2)^3 - 4];

J = @(v) [2*v(1) + v(2)^3,       3*v(1)*(v(2)^2); ...
          6*v(1)*v(2),           3*(v(1)^2) - 3*(v(2)^2)];

% 2. Parámetros de parada
tol = 1e-12;
iter_max = 50;         


% 3. Estimaciones iniciales para los 4 ceros (una por cuadrante)
X0_list = [ 1.3,   1.7;   % Cuadrante I
            3.0,   0.14;   % Cuadrante II
           -3.0 ,  0.14;   % Cuadrante III
            -0.9,  -2.0];  % Cuadrante IV            

fprintf('=== RESULTADOS CON NEWTON PARA SISTEMAS ===\n\n');

% 4. Bucle para resolver cada cero independientemente
for i = 1:size(X0_list, 1)
    x0 = X0_list(i, :)'; % Extrae vector columna 2x1
    
    [raiz, iters] = raiz_newton_sistema(f, J, x0, tol, iter_max);
    
    fprintf('Cero %d:\n', i);
    fprintf('  Iterado inicial: (%6.2f, %6.2f)\n', x0(1), x0(2));
    fprintf('  Raíz calculada:  (%15.12f, %15.12f)\n', raiz(1), raiz(2));
    fprintf('  Iteraciones:     %d\n\n', iters);
end