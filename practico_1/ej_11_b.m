
    printf(" n        A real           A calculada       Error relativo\n");
    printf("---------------------------------------------------------\n");    

for n = 1:16
    delta =10^(-n);

    a = 1;
    b =delta;
    c = sqrt(1 + delta^2);

    A_calculada = area(a,b,c);
    A_real = delta/2;

    E_realtivo = abs(A_calculada - A_real)/A_real;
    
    printf("%2d   %14.8e   %14.8e   %14.8e\n", n, A_real, A_calculada, E_relativo);
  

endfor    