function [xdouble,xsingle] =  callg()
    n = 5*(10^(-4));  
    ns = single(n);
    
    xdouble = g(n);
    xsingle = g(ns);
end    
    