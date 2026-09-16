S = [1/8];
for n=19:-1:1
    valor = (e - S(1))/(n+1);
    S = [valor, S]; 
    valor
endfor    
