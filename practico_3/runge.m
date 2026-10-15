function [x,y] = runge(n)
    r = @(y) 1/(1+25*(y^2));% Runge

    p = @(j) -1 + (2*j/n); % Puntos


    %----------- Xi -----------------
    %---- Xo=-1 <= X1 <= ...<= Xn ---

    x = p(1:n-1); % valores intermedios
    x = [-1,x]; % primer valor
    x(end+1) = 1; % ultimo valor


    %----------- Yi --------------

    y= [];
    for i=1:length(x)
        y(end+1) = r(x(i));
    endfor    

end

