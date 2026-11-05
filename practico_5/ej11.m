% Ejercicio 11: Ajuste por Mínimos Cuadrados de una Órbita Planetaria


function x_res = ej11(x,y)

    f = @(x,y) [y^2; x*y; x; y; 1];
    r = @(x) x^2;

    % Ax=b
    A = zeros(length(x), 5);
    b = zeros(length(x), 1);
    
    for i = 1:length(x)
        A(i,:) = f(x(i), y(i));
        b(i) = r(x(i));
    endfor

    x_res = A\b;

endfunction
