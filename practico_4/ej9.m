% Definición de la función y raíz exacta
f = @(x) exp(x) - 3;
r = log(3);
x0 = 1;

% Parámetros a probar: valores de d y sus órdenes de convergencia predichos p
d_vals = [1, 2, 3];
p_vals = [1, 1, 2]; % Para d=1 (probamos p=1), d=2 (lineal p=1), d=3 (cuadrático p=2)

for i = 1:length(d_vals)
    d = d_vals(i);
    p = p_vals(i);
    
    fprintf('--------------------------------------------------\n');
    fprintf('  Experimento para d = %d (orden predicho p = %d)\n', d, p);
    fprintf('--------------------------------------------------\n');
    
    x = zeros(6, 1);
    e = zeros(6, 1);
    
    x(1) = x0;
    e(1) = abs(x(1) - r);
    
    fprintf('k = 0: x_0 = %.8f, |e_0| = %.8e\n', x(1), e(1));
    
    for k = 1:4
        x(k+1) = x(k) - f(x(k)) / d;
        e(k+1) = abs(x(k+1) - r);
        
        % Evita divisiones por ruido numérico cuando se llega al límite del equipo
        if e(k) < 1e-12
            fprintf('k = %d: x_%d = %.8f, |e_%d| = %.8e (Precisión máxima alcanzada)\n', k, k, x(k+1), k, e(k+1));
            break;
        end
        
        ratio = e(k+1) / (e(k)^p);
        
        fprintf('k = %d: x_%d = %.8f, |e_%d| = %.8e, |e_%d|/|e_%d|^%d = %.6f\n', ...
            k, k, x(k+1), k, e(k+1), k, k-1, p, ratio);
    end
    fprintf('\n');
end