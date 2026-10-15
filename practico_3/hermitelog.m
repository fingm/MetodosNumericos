function w = hermitelog(n, x, a, b)

    int = []; % Nodos del intervalo [a, b]
    w = [];   % Resultado de la interpolación

    % 1. Generamos los nodos para el intervalo [a, b]
    for i = 0:n
        int(end+1) = a + i * (b - a) / n;
    endfor

    % 2. Definimos f(x) y f'(x)
    g = @(x) log(x);
    h = @(x) 1 ./ x;

    % 3. Evaluamos para cada punto del vector x
    for k = 1:length(x)
        point = x(k);
        
        % Buscamos a qué subintervalo pertenece 'point'
        j = 1;
        while (j < n) && (point > int(j+1))
            j = j + 1;
        endwhile

        % Datos en los extremos del subintervalo
        y_i  = g(int(j));
        y_ii = g(int(j+1));
        d_i  = h(int(j));
        d_ii = h(int(j+1));

        h_i = int(j+1) - int(j);
        s = point - int(j);

        % Fórmulas de Hermite
        a_coef = ((3*h_i*(s^2) - 2*(s^3)) / (h_i^3)) * y_ii;
        b_coef = ((h_i^3 - 3*h_i*(s^2) + 2*(s^3)) / (h_i^3)) * y_i;
        c_coef = (((s^2) * (s - h_i)) / (h_i^2)) * d_ii;
        d_coef = ((s * ((s - h_i)^2)) / (h_i^2)) * d_i;

        w(end+1) = a_coef + b_coef + c_coef + d_coef;
    endfor

endfunction