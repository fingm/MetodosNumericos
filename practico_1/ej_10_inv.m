I = [0.1];
J = [0];
K = [1];
for n=100:-1:1
    n
    valorI = ((1/n)-I(1))/5;
    valorJ = ((1/n)-J(1))/5;
    valorK = ((1/n)-K(1))/5;

    I = [valorI,I];
    J = [valorJ,J];
    K = [valorK,K];
    valorI
    valorJ
    valorK
endfor    