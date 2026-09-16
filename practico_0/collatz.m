function res = collatz(m)
    res = [];
    res(end+1) = m;
    iter = m;

    while true
        if mod(iter,2) == 0
            iter = iter/2;
        else
            iter = 3*iter + 1;
        endif
        res(end+1)=iter;
        
        if iter == 1
            break;
        endif;

    endwhile
end
