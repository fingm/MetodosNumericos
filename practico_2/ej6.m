A = [ 9   2   3   5   2   1;
      5   8   1   4   3   2;
      1   3   7   2   4   5;
      4   1   2   9   8   3;
      2   7   1   3   6   5;
      5   2   1   4   3   8 ];


Ainv= inv(A);

B = A;
B(:,4) = [1 1 1 1 1 1]; % igual a A, pero la cuarta columna solo 1's

u = A(:, 4) - ones(6, 1);

v= [0 ; 0; 0; 1; 0; 0 ];

A-u*v'


Binv =  Ainv +((Ainv*u)*(v'*Ainv))/(1-v'*Ainv*u);

norm(Binv-inv(B))

round(B*Binv)

