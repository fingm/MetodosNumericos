% Input matriz simetrica

A= [1 1 1 ; 1 2 2 ; 1 2 3]
%R =[1 1 1 ; 0 1 1 ; 0 0 1]
n=3;

R = zeros(3);

for i=1:n

    %Calculamos la diagonal
    sumaDiagonal = 0;
    for k=1:(i-1)
        sumaDiagonal = sumaDiagonal + R(k,i)^2;
    endfor
    R(i,i) = sqrt(A(i,i)-sumaDiagonal);

    %calculamos los elementos j>i (sobre la diagonal)
    for j=(i+1):n
        sumaProds = 0;
        for k=1:(i-1)
            sumaProds = sumaProds + R(k,i)*R(k,j);
        endfor
        R(i,j)= (A(i,j) - sumaProds )/R(i,i);
    endfor    

endfor    

R

R*R