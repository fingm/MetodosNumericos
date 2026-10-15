function [x,y] = runge_Chebyshev(n)
    r = @(y) 1/(1+25*(y^2));% Runge

    p = @(j) cos(((2*j+1)*pi)/(2*(n+1))); % Puntos

    %----------- Xi -----------------
    %---- Xo=-1 <= X1 <= ...<= Xn ---

    x = p(0:n+1); % valores intermedios

    %----------- Yi --------------

    y= [];
    for i=1:length(x)
        y(end+1) = r(x(i));
    endfor    

end

