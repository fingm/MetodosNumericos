% ------------  PARTE A  ----------------

%Problema: HnXn = bn

%caso n=5

H5 = hilb(5);
X5 = ones(5,1);
B5 = H5*X5;

Xc5 = H5\B5;

%caso n=10

H10 = hilb(10);
X10 = ones(10,1);
B10 = H10*X10; 

Xc10 = H10\B10;


% ------------  PARTE B  ----------------

%  errores
E5 = X5-Xc5;
E10 = X10-Xc10;

%residuos
R5 = B5-H5*Xc5;
R10 = B10 - H10*Xc10;

%normas errores
NE51 = norm(E5,1)
NE52 = norm(E5,2)
NE5i = norm(E5,inf)

NE101 = norm(E10,1)
NE102 = norm(E10,2)
NE10i = norm(E10,inf)


%normas residuos
NR51 = norm(R5,1)
NR52 = norm(R5,2)
NR5i = norm(R5,inf)

NR101 = norm(R10,1)
NR102 = norm(R10,2)
NR10i = norm(R10,inf)

% ------------  PARTE C  ----------------

%forma A

printf('\n');
CH51 = cond(H5,1)
norm(H5,1)*norm(invhilb(5),1)

printf('\n');
CH52 = cond(H5,2)
norm(H5,2)*norm(invhilb(5),2)

printf('\n');
CH5i = cond(H5,inf)
norm(H5,inf)*norm(invhilb(5),inf)

printf('\n');
norm(H10,1)*norm(invhilb(10),1)
CH101 = cond(H10,1)

printf('\n');
norm(H10,2)*norm(invhilb(10),2)
CH102 = cond(H10,2)

printf('\n');
norm(H10,inf)*norm(invhilb(10),inf)
CH10i = cond(H10,inf)

% Conclusion: el cálculo mediante cond coincide, salvo pequeñas diferencias numéricas, con el cálculo directo usando invhilb y norm.
