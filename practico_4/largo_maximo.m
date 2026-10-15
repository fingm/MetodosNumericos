% l1 > 0 ,  l2 > 0 , 0 < gama < pi 

function L = largo_maximo(l1, l2, gama)
    % Ecuación g(alpha) = 0
    g = @(a) (l2 * cos(pi - gama - a) ./ (sin(pi - gama - a).^2)) - (l1 * cos(a) ./ (sin(a).^2));
    
    % Definimos puntos iniciales dentro del dominio (0, pi - gamma)
    a0 = 0.1 * (pi - gama); % Recordar: Triangulo: suma de lados = 180º = pi rad => como a in (0,pi) => fi = pi-alpha-gama
    a1 = 0.9 * (pi - gama); %  Elegimos  0.1 y 0.9 para que quede estrictamente contenido en el intervalo
    
    % Resolvemos g(alpha) = 0 usando nuestra función secante
    alpha = secante(g, a0, a1, 1e-10);

    
    % Evaluamos el largo máximo
    L = (l2 / sin(pi - gama - alpha)) + (l1 / sin(alpha));
end