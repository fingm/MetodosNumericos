%------------------Parte a : Ax = b-----------

clear; clc;

A = [ -100 -23   0 ; 
       -20 -40  -1 ;
         1 -23 -50 ];
       
b = [ 14 ; -8 ; -24 ];

x_0 = A\b

%------------------Parte b -------------------

f = @(v) [ v(3)^2 + 10*v(2)^2 - 100*v(1) - 23*v(2) - 14; ...
           10*v(1)*v(2) + 10*v(2)*v(3) - 20*v(1) - 40*v(2) - v(3) + 8; ...
           10*v(2)^2 + 10*v(3)^2 + v(1) - 23*v(2) - 50*v(3) + 24 ];

[raiz_fsolve, residuo, converge] = fsolve(f, x_0)

%------------------Parte c -------------------

J = @(v) [ -100,              20*v(2) - 23,            2*v(3); ...
           10*v(2) - 20,      10*v(1) + 10*v(3) - 40,  10*v(2) - 1; ...
           1,                 20*v(2) - 23,            20*v(3) - 50 ];

% Matriz de 4 vectores iniciales (4x3)
X0_list = [
   -0.2080,   0.2955,   0.3399;   % Base (obtenido en la parte a)
   -0.2500,   0.3000,   0.3500;   % Perturbación 1
   -0.1800,   0.2500,   0.3000;   % Perturbación 2
   -0.2000,   0.3200,   0.4000    % Perturbación 3
];

tol = 1e-12;
iter_max = 50;

num_casos = size(X0_list, 1);
raices   = zeros(num_casos, 3);
iters    = zeros(num_casos, 1);
residuos = zeros(num_casos, 1);

fprintf('\n%-5s | %-28s | %-12s | %-14s\n', 'Test', 'Raíz calculada (x, y, z)', 'Iteraciones', 'Residuo ||f(x*)||');
fprintf('-----------------------------------------------------------------------------\n');

for i = 1:num_casos
    X0 = X0_list(i, :)'; 
    
    % Llamada con 2 salidas a tu función original
    [raiz, iteraciones] = raiz_newton_sistema(f, J, X0, tol, iter_max);           
    
    % Guardar resultados
    raices(i, :) = raiz';
    iters(i)     = iteraciones;
    residuos(i)  = norm(f(raiz), 2); % Norma 2 del residuo f(x*)
    
    fprintf('  %-3d | (%8.5f, %8.5f, %8.5f) | %-12d | %-14.4e\n', ...
            i, raiz(1), raiz(2), raiz(3), iteraciones, residuos(i));
end

% Orden de convergencia ($\alpha$): En el método de Newton para sistemas con raíces simples, la convergencia es cuadrática ($\alpha = 2$),
% razón por la cual se alcanzan $12$ dígitos de precisión exacta en tan solo $4$ iteraciones.