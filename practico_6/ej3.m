% Valor exacto de la integral
I_real = pi / 4;

% Listado de valores de N a probar
valores_N = [1e3, 1e4, 1e5, 1e6,1e7,1e8];

fprintf('N\t\tAproximación (q)\tError Absoluto\tError Relativo (%%)\n');
fprintf('-------------------------------------------------------------------\n');

for i = 1:length(valores_N)
    N = valores_N(i);
    q = montecarlo(N);
    
    err_abs = abs(q - I_real);
    err_rel = (err_abs / I_real) * 100;
    
    fprintf('%10d\t%14.6f\t%14.6f\t%14.4f%%\n', N, q, err_abs, err_rel);
end