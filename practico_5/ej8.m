f = @(a,b,x) a*(1 - exp(-b*x));
a_i = 1; 
b_i = 1;
tol = 1e-6;
max_iter = 50;
iter = 0;

J = @(a,b,x) [1 - exp(-b*x), a * x .* exp(-b*x)];

datos = [0.25 0.28 ; 0.75 0.57 ; 1.25 0.68 ; 1.75 0.74 ; 2.25 0.79];

t = datos(:,1); % Renombrado a 't' para no sobreescribir con el vector de parámetros
y = datos(:,2);

p = [a_i; b_i]; % Vector de parámetros [a; b]

while iter < max_iter
    b_res = y - f(p(1), p(2), t);
    A = J(p(1), p(2), t);
    
    d = A \ b_res;
    
    p = p + d;
    iter = iter + 1;
    
    if norm(d) < tol
        break;
    endif
endwhile

a_opt = p(1)
b_opt = p(2)
iteraciones = iter