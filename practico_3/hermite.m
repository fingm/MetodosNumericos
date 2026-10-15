function w = hermite(n, x)

    int = [];% intervalos [0,pi]
    w = []; % resultado de la interpolación

    for i=0:n
        int(end+1) = (i*pi)/n;
    end

    g = @(x) cos(x);
    h = @(y) -sin(y);

    for k=1:length(x)
        point = x(k);
        %buscamos a que intervalo pertenece x(j)
        j=1;
        while (j<n) && (point>int(j+1))
            j = j + 1;
        endwhile

        y_i = g(int(j));
        y_ii = g(int(j+1));
        d_i = h(int(j));
        d_ii = h(int(j+1));

        h_i = int(j+1) - int(j);
        s = (point - int(j));

        a = ((3*h_i*(s^2) - 2*(s^3)) / (h_i^3)) * y_ii;
        b = ((h_i^3 - 3*h_i*(s^2) + 2*(s^3)) / (h_i^3)) * y_i;
        c = (((s^2) * (s - h_i)) / (h_i^2)) * d_ii;
        d = ((s * ((s - h_i)^2)) / (h_i^2)) * d_i;

        w(end+1) = a + b + c + d;
    end

end
