
    % PUNTO_FIJO_ALFA Implementa el método iterativo acoplado en (alpha, x)
    % Entradas:
    %   x0       : Iterado inicial para x
    %   alpha0   : Iterado inicial para alpha
    %   tol      : Tolerancia para el criterio de paro (por defecto 1e-8)
    %   max_iter : Máximo número de iteraciones (por defecto 100)
    % Salidas:
    %   x        : Aproximación final de la raíz x*
    %   alpha    : Aproximación final de alpha*
    %   k        : Cantidad de iteraciones realizadas

function [x, alpha, k] = ej_11_punto_fijo_alfa(x0, alpha0, tol, max_iter)
    if nargin < 3, tol = 1e-8; end
    if nargin < 4, max_iter = 100; end

    x_curr = x0;
    alpha_curr = alpha0;

    for k = 1:max_iter
        % 1. Se calcula alpha_{k+1} a partir del x_k actual
        alpha_next = 4 / (4 - x_curr);

        % 2. Se calcula x_{k+1} usando el alpha_{k+1} recién actualizado
        x_next = alpha_next * exp(x_curr / 4) + (1 - alpha_next) * x_curr;

        % Criterio de parada
        if abs(x_next - x_curr) < tol
            x = x_next;
            alpha = alpha_next;
            return;
        end

        x_curr = x_next;
        alpha_curr = alpha_next;
    end
    x = x_curr;
    alpha = alpha_curr;
end