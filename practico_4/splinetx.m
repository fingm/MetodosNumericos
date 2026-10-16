function v = splinetx(x, y, u)
  % SPLINETX Spline cúbico con condición not-a-knot.
  v = interp1(x, y, u, 'spline');
end