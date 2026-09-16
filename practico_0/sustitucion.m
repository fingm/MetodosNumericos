

% matriz A
% vector fila V
% identificador de fila n

function A = sustitucion(A,V,n)
  for i=1:columns(A)
    A(n,i) = V(i);
  endfor
end

