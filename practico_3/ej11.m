v = linspace(-1, 1, 1000);
f_real = 1 ./ (1 + 25 * v.^2);

grados = [4, 8, 12, 16];

figure; % Abrimos una sola ventana para comparar

for k = 1:length(grados)
    n = grados(k);
    
    % 1. Generamos nodos NUEVOS para este n
    [x_n, y_n] = runge(n); 
    
    % 2. Evaluamos el polinomio usando los x_n e y_n recién calculados
    p_n = interpolante(x_n, y_n, v); 
    
    % 3. Graficamos en un cuadrante distinto
    subplot(2, 2, k);
    plot(v, f_real, 'k--', 'LineWidth', 1.5); hold on;
    plot(v, p_n, 'r-', 'LineWidth', 1.5);
    plot(x_n, y_n, 'bo', 'MarkerFaceColor', 'b');
    
    grid on;
    title(sprintf('Polinomio p_{%d}(x)', n));
    ylim([-0.5, 1.5]); % Limita el eje Y para notar la diferencia de amplitud
endfor