% Evaluacion densa en [0, pi]
v = linspace(0, pi, 10000);
f_real = cos(v);

% Evaluacion con n = 4
w_4 = hermite(4, v);

% Error maximo cometido
err_max = max(abs(f_real - w_4));
printf("Error máximo observado para n = 4: %.6e\n", err_max);