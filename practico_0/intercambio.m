function A = intercambio(A,n,m)
  aux = [];
  for i=1:length(A)
    aux = A(n,i);
    A(n,i)=A(m,i);
    A(m,i)= aux;
  endfor
end

