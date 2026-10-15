function [x, history] = secante(f, x0, x1, tol, max_iter)
    % SECANTE Implementación del método de la secante.
    % Entradas:
    %   f        : Función objetivo (handle @)
    %   x0, x1   : Iterados iniciales
    %   tol      : Tolerancia para el criterio de paro (por defecto 1e-8)
    %   max_iter : Máximo número de iteraciones (por defecto 100)
    % Salidas:
    %   x        : Aproximación de la raíz
    %   history  : Matriz con el historial de iteraciones [k, x_k, f(x_k)]

    if nargin < 4, tol = 1e-8; end % nargin = numero de argumentos
    if nargin < 5, max_iter = 100; end

    % Inicializar historial
    history = [];

    f0 = f(x0);
    f1 = f(x1);

    for k = 1:max_iter
        % Evitar división por cero (Observación 4.4.1 del teórico)
        den = f1 - f0; % denominador
        if abs(den) < eps
            warning('Diferencia de función casi nula en el paso %d. Se detiene el algoritmo.', k);
            x = x1;
            return;
        end

        % Cálculo del nuevo iterado x_{k+1} mediante fórmula (4.3)
        x2 = x1 - f1 * (x1 - x0) / den;
        f2 = f(x2);

        % Guardar en el historial: k, x_k, f(x_k)
        history = [history; k, x2, f2];

        % Criterio de paro (cambio absoluto o residuo pequeño)
        if abs(x2 - x1) < tol || abs(f2) < tol
            x = x2;
            return;
        end

        % Actualizar variables para la siguiente iteración
        x0 = x1;
        f0 = f1;
        x1 = x2;
        f1 = f2;
    end

    warning('Se alcanzó el número máximo de iteraciones sin lograr convergencia.');
    x = x1;
end