clear; clc; format long e;

% Desactivamos los warnings de matriz singular para una salida limpia en pantalla
warning('off', 'Octave:singular-matrix');

eps_M = eps; % Precisión de máquina (~2.22e-16)

deltas = [1e-1, 1e-4, sqrt(eps_M), 1e-10, eps_M, 1e-18];

fprintf('=== COMPARACIÓN DE MÉTODOS PARA MÍNIMOS CUADRADOS ===\n');
fprintf('%-10s | %-12s | %-12s | %-12s | %-12s\n', 'delta', 'x_exacto', 'Err Eq.Norm', 'Err Househ.', 'Err SVD');
fprintf('%s\n', repmat('-', 1, 75));

for i = 1:length(deltas)
    d = deltas(i);
    
    A_orig = [1, 1, 1;
              d, 0, 0;
              0, d, 0;
              0, 0, d];
    b = [1; 0; 0; 0];
    
    x_exacto = [1; 1; 1] / (3 + d^2);
    
    % ---------------------------------------------------------------------
    % i. MODO 1: ECUACIONES NORMALES
    % ---------------------------------------------------------------------
    ATA = A_orig' * A_orig;
    ATb = A_orig' * b;
    
    % Si delta^2 < eps_M, ATA pierde rango computacionalmente
    if d^2 < eps_M || rcond(ATA) < eps_M
        err_norm = Inf;
    else
        x_norm = ATA \ ATb;
        err_norm = norm(x_norm - x_exacto, 2);
    endif
    
    % ---------------------------------------------------------------------
    % ii. MODO 2: REFLEXIONES DE HOUSEHOLDER (QR)
    % ---------------------------------------------------------------------
    A = A_orig;
    m = size(A, 1);
    n = size(A, 2);
    Q = eye(m);
    
    for k = 1:n
        x_sub = A(k:m, k);
        ei = zeros(length(x_sub), 1); 
        ei(1) = 1;
        
        u = x_sub + sign(x_sub(1)) * norm(x_sub, 2) * ei;
        ro = 2 / (u' * u);
        
        H_sub = eye(length(x_sub)) - ro * (u * u');
        H_k = eye(m);
        H_k(k:m, k:m) = H_sub;
        
        A = H_k * A;
        Q = Q * H_k';
    endfor
    
    R = A(1:n, 1:n);
    c = (Q' * b)(1:n);
    
    % Resolver Rx = c mediante sustitución hacia atrás manual para evitar rcond warning
    x_house = zeros(n, 1);
    for k = n:-1:1
        suma = R(k, k+1:n) * x_house(k+1:n);
        if abs(R(k, k)) < eps_M
            x_house(k) = 0; % Truncamiento por rango deficiente si delta <= eps_M
        else
            x_house(k) = (c(k) - suma) / R(k, k);
        endif
    endfor
    
    err_house = norm(x_house - x_exacto, 2);
    
    % ---------------------------------------------------------------------
    % iii. MODO 3: DESCOMPOSICIÓN SVD
    % ---------------------------------------------------------------------
    [U_svd, S_svd, V_svd] = svd(A_orig);
    
    S_pinv = zeros(size(S_svd'));
    for j = 1:min(m, n)
        if S_svd(j, j) > eps_M
            S_pinv(j, j) = 1 / S_svd(j, j);
        endif
    endfor
    
    x_svd = V_svd * S_pinv * (U_svd' * b);
    err_svd = norm(x_svd - x_exacto, 2);
    
    fprintf('%-10.2e | %-12.5e | %-12.3e | %-12.3e | %-12.3e\n', ...
            d, x_exacto(1), err_norm, err_house, err_svd);
endfor

% Volvemos a activar los warnings al finalizar
warning('on', 'Octave:singular-matrix');