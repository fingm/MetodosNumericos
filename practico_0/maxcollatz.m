function [maximo , m ] = maxcollatz()
    maximo = 0;
    m=0;
    for i=1:1000
        cant = length(collatz(i));
        if cant>maximo 
            maximo = cant;
            m = i;
        endif 
    endfor
end           
