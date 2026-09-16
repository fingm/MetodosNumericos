n = 100;
A = rand(n, n);
B = rand(n, 10); % 10 vectores columna

% --- ESTRATEGIA 1: Resolver 10 veces desde cero ---
tic;
X1 = zeros(n, 10);
for i = 1:10
    X1(:, i) = bslashtx(A, B(:, i)); % Llama a lutx(A) en CADA iteración
end
tiempo1 = toc;

% --- ESTRATEGIA 2: Factorizar 1 vez con lutx y reutilizar ---
tic;
[L, U, p] = lutx(A); % Factorización LU hecha UNA SOLA VEZ
X2 = zeros(n, 10);
for i = 1:10
    pb = B(p, i);                  % Aplica permutación p al vector b
    y = bslashtx(L, pb);           % bslashtx detecta que L es triangular (forward)
    X2(:, i) = bslashtx(U, y);     % bslashtx detecta que U es triangular (backsubs)
end
tiempo2 = toc;

% --- MOSTRAR RESULTADOS ---
fprintf('Tiempo Estrategia 1 (10 veces LU desde cero): %.6f segundos\n', tiempo1);
fprintf('Tiempo Estrategia 2 (1 vez LU + 10 sustituciones): %.6f segundos\n', tiempo2);