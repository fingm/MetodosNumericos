% Datos de la tabla
v = [0 10 20 30 40 50 60];
d = [0 5 20 46 70 102 153];

% Distancia máxima permitida (a lo sumo 60 m)
d_max = 60;

%% 1. Interpolación lineal a trozos
% En Octave, interp1 con 'linear' hace la interpolación lineal a trozos
f_linear = @(x) interp1(v, d, x, 'linear') - d_max;
v_lim_linear = fzero(f_linear, [30, 40]);

%% 2. Interpolación cúbica Hermite (PCHIP)
% Usando pchiptx (o interp1 con 'pchip')
f_pchip = @(x) pchiptx(v, d, x) - d_max;
v_lim_pchip = fzero(f_pchip, [30, 40]);

%% 3. Interpolación con Splines Cúbicas
% Usando splinetx (o interp1 con 'spline')
f_spline = @(x) splinetx(v, d, x) - d_max;
v_lim_spline = fzero(f_spline, [30, 40]);

%% Mostrar resultados por pantalla
fprintf('=== RESULTADOS DE VELOCIDAD LÍMITE (d <= 60 m) ===\n');
fprintf('1. Lineal a trozos:      v <= %.4f m/s (%.2f km/h)\n', v_lim_linear, v_lim_linear * 3.6);
fprintf('2. PCHIP (pchiptx):       v <= %.4f m/s (%.2f km/h)\n', v_lim_pchip, v_lim_pchip * 3.6);
fprintf('3. Spline (splinetx):     v <= %.4f m/s (%.2f km/h)\n', v_lim_spline, v_lim_spline * 3.6);

%% Graficar las tres interpolaciones
v_grid = 0:0.1:60;

d_lin_grid = interp1(v, d, v_grid, 'linear');
d_pchip_grid = pchiptx(v, d, v_grid);
d_spline_grid = splinetx(v, d, v_grid);

figure;
plot(v, d, 'ro', 'MarkerSize', 8, 'LineWidth', 2, 'DisplayName', 'Datos de la tabla'); hold on;
plot(v_grid, d_lin_grid, 'b--', 'LineWidth', 1.5, 'DisplayName', 'Lineal a trozos');
plot(v_grid, d_pchip_grid, 'g-', 'LineWidth', 1.5, 'DisplayName', 'PCHIP (pchiptx)');
plot(v_grid, d_spline_grid, 'm-.', 'LineWidth', 1.5, 'DisplayName', 'Spline (splinetx)');

% Línea de cota d = 60 m
line([0 60], [60 60], 'Color', 'k', 'LineStyle', ':', 'LineWidth', 1.5, 'DisplayName', 'Límite 60 m');

xlabel('Velocidad v (m/s)');
ylabel('Distancia de frenado d (m)');
title('Interpolación d(v) y velocidad límite para d \le 60 m');
grid on;
legend('location', 'northwest');