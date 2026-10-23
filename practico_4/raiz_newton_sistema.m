function [raiz, k] = raiz_newton_sistema(f, J, x0, tol, iter)
    % RAIZ_NEWTON_SISTEMA Método de Newton para sistemas de d ecuaciones no lineales.
    % Entradas:
    %   f    : Función vectorial f: R^d -> R^d (handle @)
    %   J    : Matriz Jacobiana de f (handle @)
    %   x0   : Vector columna con la estimación inicial (d x 1)
    %   tol  : Tolerancia de error relativo para el criterio de parada
    %   iter : Máxima cantidad de iteraciones permitidas
    %
    % Salida:
    %   raiz : Vector columna con la aproximación hallada de la raíz (d x 1)
    %   k    : Cantidad de iteraciones realizadas hasta la convergencia

    x = x0(:);
    historial = zeros(length(x), iter + 1);
    historial(:, 1) = x;

    for k = 1:iter
        fk = f(x);
        Jk = J(x);

        delta_x = Jk \ (-fk);
        x_next = x + delta_x;
        historial(:, k + 1) = x_next;

        if norm(x_next - x, 2) <= tol * norm(x, 2)
            raiz = x_next;
            historial = historial(:, 1:k+1); % Recorta al tamaño real
            return;
        end

        x = x_next;
    end

    warning('Máximo de iteraciones alcanzado.');
    raiz = x;
    historial = historial(:, 1:k+1);
end