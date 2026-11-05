% 1. Matriz de Householder calculada en el inciso anterior
H = [ -9/11,  -2/11,  -6/11;
      -2/11,  54/55,  -3/55;
      -6/11,  -3/55,  46/55 ];

% 2. Obtener autovectores (V) y autovalores (D)
[V, D] = eig(H);

% Los autovalores estarán en la diagonal de D: [-1, 1, 1]
% Las columnas de V son los autovectores correspondientes.

% 3. Identificar el autovector asociado a lambda = -1
% (Será la columna de V correspondiente a D(i,i) == -1)
idx_menos_uno = find(abs(diag(D) - (-1)) < 1e-6);
u_auto = V(:, idx_menos_uno);

% 4. Identificar un autovector asociado a lambda = 1
% (Será cualquier columna de V correspondiente a D(i,i) == 1)
idx_uno = find(abs(diag(D) - 1) < 1e-6);
v_auto = V(:, idx_uno(1)); % Tomamos el primero de ellos

% 5. Verificación de las condiciones
disp('Autovector u (tal que Hu = -u):');
disp(u_auto);

disp('Verificación H*u + u (debe ser aprox 0):');
disp(norm(H*u_auto + u_auto));

disp('Autovector v (tal que Hv = v):');
disp(v_auto);

disp('Verificación H*v - v (debe ser aprox 0):');
disp(norm(H*v_auto - v_auto));