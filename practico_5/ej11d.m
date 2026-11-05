% === REPETICIÓN DE PARTE B CON RANGO BAJO (SVD) ===

% 1. Construir la matriz perturbada A_r y el vector b_r (de la Parte b)
A_r = zeros(length(x_r), 5);
b_r = zeros(length(x_r), 1);
for i = 1:length(x_r)
    A_r(i,:) = [y_r(i)^2, x_r(i)*y_r(i), x_r(i), y_r(i), 1];
    b_r(i)   = x_r(i)^2;
endfor

% 2. Descomposición SVD de la matriz perturbada
[U_r, S_r, V_r] = svd(A_r, 0);
sigma_r = diag(S_r);

% 3. Soluciones truncadas x_{b,k} para k = 1,...,5
X_bk = zeros(5, 5);
for k = 1:5
    xk = zeros(5, 1);
    for i = 1:k
        xk = xk + ((U_r(:,i)' * b_r) / sigma_r(i)) * V_r(:,i);
    endfor
    X_bk(:, k) = xk;
endfor

% 4. Gráfico de las órbitas perturbadas truncadas vs la órbita exacta original (x_a)
figure(3);
plot(x, y, 'ro', 'markerfacecolor', 'r'); hold on;
plot(x_r, y_r, 'k*');

for k = 1:5
    xk = X_bk(:, k);
    Z_bk = X.^2 - (xk(1)*Y.^2 + xk(2)*X.*Y + xk(3)*X + xk(4)*Y + xk(5));
    contour(X, Y, Z_bk, [0 0], 'linewidth', 1.5);
endfor

title('Efecto del Ruido en las Soluciones SVD Truncadas (k = 1...5)');
legend('Datos orig.', 'Datos pert.', 'k=1', 'k=2', 'k=3', 'k=4', 'k=5', 'location', 'northeast');
grid on; hold off;