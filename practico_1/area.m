function A = area(a,b,c)
    if (a<=0) || (b<=0) || (c<=0) || (a>=b+c) || (b>=a+c) || (c>=a+b)
        disp("Error");
    else
        p = (a+b+c)/2;
        A = sqrt(p*(p-a)*(p-b)*(p-c));
    endif
end