function coc = aureo(n)
    fib = fibonacci(n);
    coc = fib(2:end)./fib(1:end-1);
    aur = (1+sqrt(5))/2;
    disp(aur);
end;    

