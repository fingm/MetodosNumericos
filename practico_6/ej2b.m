% Definición de la función g(t) = 2*e^(t^2) 
f = @(x) 2*exp(x.^2);
a = 0;
b = 1;

% Usamos la función integral de MATLAB para tener una referencia de alta precisión
integral_exacta = integral(f, a, b); 

% Valores de n a probar
valores_n = [10^2, 10^3, 10^4, 10^5, 10^6];

fprintf('\nIntegral exacta (alta precisión): %-18.10e\n', integral_exacta);
fprintf('%-8s %-12s %-18s %-18s %s\n', 'n', 'h', 'Aproximacion q', 'Error absoluto', 'Cociente Error[i-1]/Error[i]');
fprintf('------------------------------------------------------------------------------------\n');

error_anterior = [];
for i = 1:length(valores_n)
    n = valores_n(i);
    h = (b - a) / n;
    
    q = trapecio(f, a, b, n);
    error_abs = abs(q - integral_exacta);
    
    if i > 1
        cociente = error_anterior / error_abs;
        fprintf('%-8d %-12.5f %-18.10f %-18.10e %.4f\n', n, h, q, error_abs, cociente);
    else
        fprintf('%-8d %-12.5f %-18.10f %-18.10e -\n', n, h, q, error_abs);
    end
    
    error_anterior = error_abs;
end

