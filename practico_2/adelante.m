% Quiero solucionar Ax = b

A = [1 0 0 ; 2 1 0 ; 3 2 4 ] 

n=3;

b = [1  7 21];
 
x = [b(1)/A(1,1)]; 

for i=2:n
    suma=0;
    for j = 1:i-1
        suma = suma +  A(i,j)*x(j);
    endfor    
    x(i) = (b(i)- suma)/A(i,i);
endfor    

disp(x)