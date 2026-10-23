
g_1 = @(x) -log(x)
g_2 = @(x) e^(-x)
g_3 = @(x) (x+e^(-x))/2


X_1 = [0.5];
X_2 = [0.5];
X_3 = [0.5];

for i=2:20
    X_1(end+1) = g_1(X_1(end));
    X_2(end+1) = g_2(X_2(end));
    X_3(end+1) = g_3(X_3(end));
endfor    

X_1
X_2
X_3
