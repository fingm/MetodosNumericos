function det = determinante(A)
    [L, U, p, sig] = lutx(A);
    det = prod(diag(U));
end