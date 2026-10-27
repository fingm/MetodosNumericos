% Ejercicio 2 - Práctico 5

% Matriz de diseño A (6x2) y vector b (6x1)
A = [1 1; 
     2 1; 
     1 2; 
     2 3; 
     2 5; 
     2 4];

b = [30.006; 
     44.013; 
     46.006; 
     76.012; 
     108.010; 
     92.011];

% Descomposición QR reducida
[Q, R] = qr(A, 0);

% Solución R * theta = Q^T * b
theta = R \ (Q' * b);

x_N = theta(1);
y_O = theta(2);

fprintf('Peso atómico del Nitrógeno (N) = %.4f\n', x_N);
fprintf('Peso atómico del Oxígeno (O)   = %.4f\n', y_O);