function w = interpolante(x,y,v)
    n_eval = length(v);
    n_puntos = length(x);

    w = zeros(1,n_eval);

    for k=1:n_eval
        suma=0;
        for i=1:n_puntos
            L=1;

            for j=1:n_puntos
                if i !=j
                    L = L * (v(k)-x(j))/(x(i)-x(j));
                endif
            endfor
            suma = suma + L*y(i);

        endfor
        w(k) = suma;
    endfor
end