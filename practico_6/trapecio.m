function q = trapecio(f, a, b, n)
    % trapecio: Calcula la integral aproximada usando la regla del trapecio compuesta.
    %   f: función a integrar
    %   a, b: límites de integración
    %   n: número de subintervalos
    
    h = (b - a) / n;
    x = linspace(a, b, n + 1);
    y = f(x);
    
    % Aplicación de la fórmula del trapecio compuesta
    q = h * (0.5 * y(1) + sum(y(2:end-1)) + 0.5 * y(end));
end