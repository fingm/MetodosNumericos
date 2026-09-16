for k = 1:3

    h = 10^(-k);

    y = resolverEDO(h);

    N = 1/h;
    x = linspace(0,1,N+1);

    plot(x,y);
    hold on;

endfor

grid on;
xlabel('x');
ylabel('y(x)');
legend('h=0.1','h=0.01','h=0.001');