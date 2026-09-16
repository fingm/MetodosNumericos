function x = tridiagonal(A,b)

    n = length(b);

    % Vectores que representan L y U
    l = zeros(n,1);
    c = zeros(n,1);
    u = zeros(n-1,1);

    % Parte a: construir LU
    c(1) = A(1,1);

    for k = 1:n-1
        u(k) = A(k,k+1);
    endfor

    for k = 2:n
        l(k) = A(k,k-1)/c(k-1);
        c(k) = A(k,k) - l(k)*u(k-1);
    endfor

    % Resolver Ly = b
    y = zeros(n,1);
    y(1) = b(1);

    for k = 2:n
        y(k) = b(k) - l(k)*y(k-1);
    endfor

    % Resolver Ux = y
    x = zeros(n,1);
    x(n) = y(n)/c(n);

    for k = n-1:-1:1
        x(k) = (y(k) - u(k)*x(k+1))/c(k);
    endfor

endfunction