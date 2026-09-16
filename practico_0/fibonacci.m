function fibo = fibonacci(n)
    fibo = [];
    for i=0:n
        if i == 0 || i == 1
            fibo(end+1) = 1;
        else
            fibo(end+1) = fibo(i) + fibo(i-1);   
        endif;    
    endfor    
end           