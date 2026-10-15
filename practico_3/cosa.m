% Rectángulo [0,3] x [0,2]
x = [0, 3, 3, 0];
y = [0, 0, 2, 2];

figure;
fill(x, y, [0.4, 0.5, 0.8], 'LineWidth', 2);
grid on;
axis equal;
axis([-0.5 4 -0.5 3]);

xlabel('x'); ylabel('y');
title('Dominio rectangular D: [0,3] x [0,2]');
xticks(0:3); yticks(0:2);