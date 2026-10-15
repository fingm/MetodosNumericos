f2 = @(x) (3750*(x.^2)-50)./(1+25*(x.^2)).^3;

v=linspace(-1,1,1000);

f_segunda = f2(v);


figure;
plot(v, abs(f_segunda), 'r-', 'LineWidth', 2);
grid on;
title('|f''(x)| en [-1, 1]');
xlabel('x'); ylabel('|f''(x)|');