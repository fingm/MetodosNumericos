function s = serie2(f,e)
    s = 0;
    i = 0;
    while f(i) >= e
        s = s + f(i);
        i = i+1;
    endwhile
     s = s + f(i);
end         
