function X = inversa(A)
    % INVERSA Computa la inversa de una matriz A usando lutx
    % Resuelve A * x_j = e_j para cada columna j de la identidad
    
    n = rows(A);

    % Matriz identidad I_n
    B = eye(n, n);

    % 1. Factorización LU con pivoteo parcial (se ejecuta UNA SOLA VEZ)
    [L, U, p] = lutx(A);

    % 2. Reordenar las filas de la Identidad según las permutaciones de p
    B = B(p, :);

    % Reservamos espacio en memoria para las matrices n x n
    Y = zeros(n, n);
    X = zeros(n, n);

    % 3. Sustitución hacia adelante (Sustitución Progresiva)
    % Resolver L * Y = B  (procesa todas las columnas en paralelo)
    for k = 1:n
        Y(k, :) = B(k, :) - L(k, 1:k-1) * Y(1:k-1, :);
    end

    % 4. Sustitución hacia atrás (Sustitución Regresiva)
    % Resolver U * X = Y  (procesa todas las columnas en paralelo)
    for k = n:-1:1
        X(k, :) = (Y(k, :) - U(k, k+1:n) * X(k+1:n, :)) / U(k, k);
    end
end