% Quiero solucionar Ax = b

A = [3 2 1 ; 0 1 2 ; 0 0 4 ]; 

n=3;

b = [15  9  8];
 
x = [b(n)/A(n,n)]; 

for i= n:-1:1
    suma=0;
    for j = i+1:n
        suma = suma +  A(i,j)*x(j);
    endfor    
    x(i) = (b(i)- suma)/A(i,i);
endfor    

disp(x)