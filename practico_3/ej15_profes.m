















% Definición de datos con derivadas prefijadas en las puntas [d0, y0, y1, y2, d2]
x = [0 2 3];
y = [0,  0 1 2,  0]; % d0=0 al principio, d2=0 al final

% Construir el polinomio a trozos (pp)
sc = spline(x, y);

% Evaluar y graficar en una grilla fina
xx = linspace(0, 3, 200);
yy = ppval(sc, xx);

plot(xx, yy, '-r', 'LineWidth', 2);
grid on;
title('Spline Cúbica Clamped');
xlabel('x');
ylabel('f(x)');