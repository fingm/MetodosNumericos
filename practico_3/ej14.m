x = [ 0.1,1,2,2.9];
y = log(x);
v = 1.5;

%-------------- parte a ------------------

inter_a = interpolante(x,y,v);
real = log(v);

err_a = abs(inter_a - real);

printf("\nInterpolante P_3(1.5): %.8f\n", inter_a);
printf("Valor real log(1.5):   %.8f\n", real);
printf("Error de interpolación: %.8e\n", err_a);

%-------------- parte b ------------------

inter_b = hermitelog(1, v, 1, 2);

err_b = abs(inter_b - real);

printf("\nInterpolante P_3(1.5): %.8f\n", inter_b);
printf("Valor real log(1.5):   %.8f\n", real);
printf("Error de interpolación: %.8e\n", err_b);

%-------------- parte c ------------------
% Malla para graficar en [1, 2]
grid = linspace(1, 2, 500);
f_grid = log(grid);

% Evaluamos ambas interpolantes en la malla
y_a = interpolante(x, y, grid);
y_b = hermitelog(1, grid, 1, 2);

% Gráfica
figure;
plot(grid, f_grid, 'k-', 'LineWidth', 2); hold on;
plot(grid, y_a, 'b--', 'LineWidth', 1.5);
plot(grid, y_b, 'r-.', 'LineWidth', 1.5);
plot([1, 2], log([1, 2]), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);
plot(v, real, 'gm', 'MarkerFaceColor', 'g', 'MarkerSize', 8);

title('Interpolación de f(x) = log(x) en [1, 2]');
legend('f(x) real', 'P_3 Lagrange (4 nodos)', 'H_3 Hermite (2 nodos)', 'Nodos [1,2]', 'Evaluación v=1.5', 'Location', 'southeast');
xlabel('x'); ylabel('y');
