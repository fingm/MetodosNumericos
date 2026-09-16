P=[0.5 0.2 0.2 0.1; 0.3 0.4 0.2 0.1;0.2 0.3 0.4 0.1 ; 0.1 0.1 0.2 0.6];

% (I-Pt)x=0
A = eye(4)-P'

% Reemplazo la primer ecuacion
A(1,:) =[1 1 1 1];

% Usamos que x1 + x2 + x3 + x4 = 1


b = [ 1; 0; 0 ; 0];

x= A\b %pi = distribucion estacionaria

%Esto significa que, cuando la cadena está en estado estacionario, la probabilidad de estar en cada estado es:

%Estado 1 → \(30\%\)
%Estado 2 → \(25\%\)
%Estado 3 → \(20\%\)
%Estado 4 → 25%

%  verificacion

pii  = x'
pii*P

norm(pii*P-pii)