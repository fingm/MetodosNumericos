function q = montecarlo(N)
    % Generar N puntos aleatorios uniformes en el intervalo [0, 1] x [0, 1]
    x = rand(N, 1);
    y = rand(N, 1);
    
    % Contar cuántos puntos caen por debajo del gráfico de f(x)
    % Condición: y <= sqrt(1 - x^2)  <=>  x^2 + y^2 <= 1
    N0 = sum(x.^2 + y.^2 <= 1);
    
    % Área de la caja [0, 1] x [0, 1]
    A = 1;
    
    % Estimación de Monte Carlo
    q = (N0 / N) * A;
end