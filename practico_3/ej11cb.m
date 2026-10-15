% 1. Malla fina para aproximar la norma supremo
v = linspace(-1, 1, 10000);
f_v = 1 ./ (1 + 25 * v.^2);

% 2. Medir el error ||f - p16||_inf
[x16, y16] = runge_Chebyshev(16); % O runge(16) según la parte usada
p16_v = interpolante(x16, y16, v);
E16 = max(abs(f_v - p16_v));

fprintf('Error ||f - p16||_inf: %e\n', E16);

% 3. Estimación teórica del número de subintervalos N (mínimo N = 1)
N_est = max(1, ceil(sqrt(25 / E16)));
nodos_est = N_est + 1;

fprintf('Subintervalos estimados N: %d (Nodos: %d)\n', N_est, nodos_est);

% 4. Interpolación lineal a trozos con interp1
x_lin = linspace(-1, 1, nodos_est);
y_lin = 1 ./ (1 + 25 * x_lin.^2);

s_v = interp1(x_lin, y_lin, v, 'linear');
E_lineal = max(abs(f_v - s_v));

fprintf('Error de la lineal a trozos ||f - s||_inf: %e\n', E_lineal);