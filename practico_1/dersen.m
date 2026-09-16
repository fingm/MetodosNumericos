    f = @(x) sin(5*x);
    exacta = 5*cos(5)

    a= 1;

    k = 0:20; % vector con cada casillero incrementado en 1 desde 0
    h = 0.1.^k; % h es un vector, itero en cada elemento elevando al correspondiente del vector k. 

    delta = (f(a+h) - f(a-h)) ./ (2*h)

    error_absoluto = abs(delta - exacta)

    % Graficar en escala logarítmica
    loglog(h, error_absoluto, '-o', 'LineWidth', 2);
    grid on;
