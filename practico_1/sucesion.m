

n=10;

S = [2];

minimo = 0;
encontrado = false;

for k=1:n
    S(end+1) = (((S(end)^2)+2)/2)*(1/S(end));
    if (S(end) == sqrt(2)) && (!encontrado) 
        encontrado = true;
        minimo = k;
    endif
endfor

format short e
error_abs = abs(S - sqrt(2));


disp("Vector S: ");
disp(S);

disp("Error absoluto: ");
disp(error_abs);

disp("Minimo n: ")
disp(minimo);