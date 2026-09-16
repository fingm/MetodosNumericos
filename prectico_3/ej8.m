function ej8()
    % 1. Datos del problema
    x_todos = [5, 10, 15, 20, 30, 40, 50, 60, 70, 80, 90, 100];
    y_todos = [1.226, 1.498, 1.822, 2.138, 2.662, 2.840, 2.807, 2.542, 2.210, 1.877, 1.539, 1.201];

    % Nodos de interpolacion para p5
    x_p5 = [10, 20, 40, 60, 80, 100];
    y_p5 = [1.498, 2.138, 2.840, 2.542, 1.877, 1.201];

    % Puntos de reserva y sus valores reales de viscosidad
    v_res = [5, 15, 30, 50, 70, 90];
    y_res_real = [1.226, 1.822, 2.662, 2.807, 2.210, 1.539];

    % 2. Evaluacion y calculo de errores en los puntos de reserva
    w_res = interpolante(x_p5, y_p5, v_res);

    printf('================ ERRORES EN PUNTOS RESERVADOS (p5) ================\n');
    printf('%-6s | %-8s | %-8s | %-10s | %-10s\n', 'w (%)', 'Real', 'p5(w)', 'Err. Abs.', 'Err. Rel.');
    printf('-------------------------------------------------------------------\n');
    for i = 1:length(v_res)
        err_abs = abs(w_res(i) - y_res_real(i));
        err_rel = (err_abs / y_res_real(i)) * 100;
        printf(' %3d   |  %.3f   |  %.4f  |   %.4f   |   %5.2f%%\n', ...
               v_res(i), y_res_real(i), w_res(i), err_abs, err_rel);
    endfor
    printf('===================================================================\n\n');

    % 3. Evaluacion en malla fina para trazado continuo de curvas
    v_fina = linspace(5, 100, 500);
    w_p5 = interpolante(x_p5, y_p5, v_fina);
    w_p11 = interpolante(x_todos, y_todos, v_fina);

    % 4. Generacion del grafico
    figure;
    plot(v_fina, w_p5, 'b-', 'LineWidth', 2, 'DisplayName', 'p_5(w) (Grado 5)');
    hold on;
    plot(v_fina, w_p11, 'r--', 'LineWidth', 1.8, 'DisplayName', 'p_{11}(w) (Grado 11)');
    plot(x_todos, y_todos, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6, 'DisplayName', '12 datos originales');
    plot(x_p5, y_p5, 'rx', 'MarkerSize', 10, 'LineWidth', 2, 'DisplayName', 'Nodos de p_5');
    hold off;

    xlabel('Porcentaje w (%)');
    ylabel('Viscosidad V(w)');
    title('Interpolacion Polinomial de Viscosidad');
    grid on;
    
endfunction

Para p_5(w) La aproximación captura adecuadamente la tendencia física de la viscosidad. Los errores 
relativos se mantienen acotados por debajo del 2.1% en todos los puntos de reserva y la curva
mantiene una concavidad suave.
Para p_11(w) A pesar de tener error nulo en los nodos, no captura la 
tendencia global del sistema debido al fenómeno de Runge, evidenciado en las oscilaciones de alta amplitud 
hacia el extremo derecho del dominio w > 80.