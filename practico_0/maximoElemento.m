function max = maximoElemento(A)
    max= A(1,1);
    for i=1:numel(A)
        if(A(i) > max)
            max = A(i);
        endif    
    endfor
end        