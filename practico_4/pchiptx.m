function v = pchiptx(x, y, u)
  % PCHIPTX  Piecewise Cubic Hermite Interpolating Polynomial.
  x = x(:); y = y(:);
  n = length(x);
  h = diff(x);
  delta = diff(y)./h;
  
  % Calcular pendientes d_k
  d = zeros(n,1);
  for k = 1:n-2
     if sign(delta(k))*sign(delta(k+1)) > 0
        w1 = 2*h(k+1) + h(k);
        w2 = h(k+1) + 2*h(k);
        d(k+1) = (w1 + w2)/(w1/delta(k) + w2/delta(k+1));
     end
  end
  
  % Puntos extremos
  d(1) = ((2*h(1)+h(2))*delta(1) - h(1)*delta(2))/(h(1)+h(2));
  if sign(d(1)) ~= sign(delta(1))
     d(1) = 0;
  elseif (sign(delta(1)) ~= sign(delta(2))) && (abs(d(1)) > abs(3*delta(1)))
     d(1) = 3*delta(1);
  end
  
  d(n) = ((2*h(n-1)+h(n-2))*delta(n-1) - h(n-1)*delta(n-2))/(h(n-1)+h(n-2));
  if sign(d(n)) ~= sign(delta(n-1))
     d(n) = 0;
  elseif (sign(delta(n-1)) ~= sign(delta(n-2))) && (abs(d(n)) > abs(3*delta(n-1)))
     d(n) = 3*delta(n-1);
  end

  % Evaluar en u
  v = interp1(x, y, u, 'pchip');
end