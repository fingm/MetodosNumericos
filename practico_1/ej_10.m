I = [log(6/5)];
for n=1:30
    n
    valor = 1/n - 5*I(end);
    I(end+1) = valor;
    valor
endfor    