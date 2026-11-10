% Definición de la función f(x)
f = @(x) 2 ./ (1 + x.^2);
a = -1;
b = 1;
pi_exacta = pi;

% Valores de n a probar (duplicando en cada paso)
valores_n = [10, 20, 40, 80, 160, 320, 640,1280,2560,5120,10240,20480];

fprintf('%-8s %-12s %-18s %-18s %s\n', 'n', 'h', 'Aproximacion q', 'Error absoluto', 'Cociente Error[i-1]/Error[i]');
fprintf('------------------------------------------------------------------------------------\n');

error_anterior = [];
for i = 1:length(valores_n)
    n = valores_n(i);
    h = (b - a) / n;
    
    % Llamada a la función implementada
    q = trapecio(f, a, b, n);
    
    error_abs = abs(q - pi_exacta);
    
    if i > 1
        cociente = error_anterior / error_abs;
        fprintf('%-8d %-12.5f %-18.10f %-18.10e %.4f\n', n, h, q, error_abs, cociente);
    else
        fprintf('%-8d %-12.5f %-18.10f %-18.10e -\n', n, h, q, error_abs);
    end
    
    error_anterior = error_abs;
end