% Extrapolacion de Richardson
error_real = exp(1);

printf("n  | e0                | Error e0        | e1                | Error e1\n");
printf("-------------------------------------------------------------------------\n");

for n = 2:4
    h = 10^(-n);

    e0 = (1+h)^(1/h);
    e1 = 2*(1+h/2)^(2/h) - e0;

    error_0 = abs(e0 - error_real);
    error_1 = abs(e1 - error_real);

    printf("%d  | %.12f  | %.5e    | %.12f  | %.5e\n", n, e0, error_0, e1, error_1);
end