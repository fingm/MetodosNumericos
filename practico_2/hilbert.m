% ------------  PARTE A  -----------------

% Problema: Hn*Xn = Bn

% Caso n = 5
H5 = hilb(5);
X5 = ones(5,1); % solucion teorica exacta
B5 = H5*X5; 
Xc5 = H5\B5; % valor calculado

% Caso n = 10
H10 = hilb(10);
X10 = ones(10,1);% solucion teorica exacta
B10 = H10*X10; 
Xc10 = H10\B10;% valor calculado

% ------------  PARTE B  ---------------
% Errores
E5 = X5 - Xc5;
E10 = X10 - Xc10;

% Residuos
R5 = B5 - H5*Xc5;
R10 = B10 - H10*Xc10;

% Normas de errores
NE51 = norm(E5,1);
NE52 = norm(E5,2);
NE5i = norm(E5,inf);

NE101 = norm(E10,1);
NE102 = norm(E10,2);
NE10i = norm(E10,inf);

% Normas de residuos
NR51 = norm(R5,1);
NR52 = norm(R5,2);
NR5i = norm(R5,inf);

NR101 = norm(R10,1);
NR102 = norm(R10,2);
NR10i = norm(R10,inf);

% ------------  PARTE C  ----------------

% --- Para n = 5 ---
cond_octave_5_1 = cond(H5, 1);
cond_inv_5_1    = norm(H5, 1) * norm(invhilb(5), 1);
dif_5_1         = abs(cond_octave_5_1 - cond_inv_5_1)

cond_octave_5_2 = cond(H5, 2);
cond_inv_5_2    = norm(H5, 2) * norm(invhilb(5), 2);
dif_5_2         = abs(cond_octave_5_2 - cond_inv_5_2)

cond_octave_5_i = cond(H5, inf);
cond_inv_5_i    = norm(H5, inf) * norm(invhilb(5), inf);
dif_5_i         = abs(cond_octave_5_i - cond_inv_5_i)


% --- Para n = 10 ---
cond_octave_10_1 = cond(H10, 1);
cond_inv_10_1    = norm(H10, 1) * norm(invhilb(10), 1);
dif_10_1         = abs(cond_octave_10_1 - cond_inv_10_1)

cond_octave_10_2 = cond(H10, 2);
cond_inv_10_2    = norm(H10, 2) * norm(invhilb(10), 2);
dif_10_2         = abs(cond_octave_10_2 - cond_inv_10_2)

cond_octave_10_i = cond(H10, inf);
cond_inv_10_i    = norm(H10, inf) * norm(invhilb(10), inf);
dif_10_i         = abs(cond_octave_10_i - cond_inv_10_i)

% ------------  PARTE D  ----------------
% Estimación de dígitos correctos esperados: 16 - t, con t = log10(cond_2)

t5 = log10(cond_octave_5_2);
digitos_esperados_5 = 16 - t5

t10 = log10(cond_octave_10_2);
digitos_esperados_10 = 16 - t10
