clc
clf
clear
global k Cbo Vo vo V1 t1 Nb1 
 
k = 0.1; %min^-1
Cbo = 1; %M
vo = 25; %L/min
Vo = 5;  %L
V1 = 255; %L
 
 
Yo = [Vo 0 0];
 
t1 = (V1 - Vo)./vo;
Nb1 = ((vo*Cbo)./k)*(1-exp(-k*t1));

t0 = 0;
tf = 25.0;
tspan = [t0 tf];
 
[t, Y] = ode45('No1deriv', tspan, Yo);    % for "ode45" solver 
t2 = linspace(1,25,25);

for i = 1:25                    
    Xa(i,:) = No1ana(i);
end

plot (t, Y(:,1), '-',t, Y(:,2), '-',t, Y(:,3), '-', t2, Xa(:,1),'o',t2,Xa(:,2),'o',t2, Xa(:,3),'o'), %title ('Concentration vs Time'), ...
legend ('V', 'N_B', 'N_R', 'Va', 'N_Ba', 'N_Ra'), xlabel ('t, min'), ylabel ('V (L), N_B (mol), N_R (mol), Va (L), N_Ba (mol), N_Ra (mol)');


