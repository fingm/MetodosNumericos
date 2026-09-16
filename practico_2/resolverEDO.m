function y = resolverEDO(h)

    a = 0;
    b = 1;

    N = (b-a)/h;

    x = linspace(a,b,N+1);
    xi = x(2:N);

    % Matriz tridiagonal
    A = zeros(N-1,N-1);

    for i = 1:N-1
        A(i,i) = 1.5*h^2 - 2;

        if i > 1
            A(i,i-1) = 1;
        endif

        if i < N-1
            A(i,i+1) = 1;
        endif
    endfor

    % Vector del lado derecho
    rhs = h^2 * sin(pi/2 * xi);

    % Condiciones de borde
    rhs(1) = rhs(1) - 1;
    rhs(N-1) = rhs(N-1) - 1;

    % Algoritmo de Thomas
    y_interior = tridiagonal(A,rhs');

    % Agregamos extremos
    y = [1; y_interior; 1];

endfunction