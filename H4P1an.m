function y = H4P1an(t)

global a1 a2 R Ho

y(:,1) = Ho*exp(-t*a1/(pi*R*R));
   
y(:,2) = (sqrt(Ho) - a2*t/(2*pi*R*R))^2;
   
