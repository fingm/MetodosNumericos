% Extrapolacion de Richardson
    error_real = exp(1);

for n = 2:4
    h = 10^(-n);

    e0 = (1+h)^(1/h);

    e1 = 2*(1+h/2)^(2/h)- e0;

    error_0 = abs(e0-error_real);
    error_1 = abs(e1-error_real);

    printf("%d  %.15e  %.15e  %.15e  %.15e\n", n, e0, error_0, e1, error_1);

end