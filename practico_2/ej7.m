clear;
clc;

a = 0;
b = 5;

alpha = 0;
beta = sin(5);

N = 50;

h = (b-a)/N;

% Puntos de la malla
x = linspace(a,b,N+1); % genera N+1 puntos igualmente separados entre a y b.

% Puntos interiores
xi = x(2:N);

% Funciones
f = @(x) sin(x).*(exp(x)-1);
g = @(x) exp(x);

% Matriz A
A = zeros(N-1,N-1);

for i = 1:N-1
    A(i,i) = g(xi(i))*h^2 - 2;

    if i > 1
        A(i,i-1) = 1;
    endif

    if i < N-1
        A(i,i+1) = 1;
    endif
endfor

% Vector b
rhs = f(xi)*h^2;

% Condiciones de borde
rhs(1) = rhs(1) - alpha;
rhs(N-1) = rhs(N-1) - beta;

% Resolver sistema
y_interior = A\rhs';

% Agregar los extremos
y = [alpha; y_interior; beta];

% Solución exacta
y_exacta = sin(x');

% Graficar
plot(x,y,'o-');
hold on;
plot(x,y_exacta,'-');

xlabel('x');
ylabel('y(x)');
legend('Aproximación numérica','Solución exacta');
grid on;