S = [1];
for n=1:20
    S(end+1) = e-(n+1)*S(end);
    n
    S(end)
endfor    
