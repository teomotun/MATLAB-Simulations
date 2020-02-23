clc
clf
clear
global Cao k Vo v tau Castar Crstar

k = 0.04;               %min^-1
Vo = 1000;              %L
Cao = 1;                %M
v = 25;                 %L/min
tau = Vo/v;

Castar = Cao./(1 + k*tau);
Crstar = k*tau *Castar;


Co = [Castar Crstar];
 
t0 = 0;
tf = 100;
tspan = [t0 tf];
 
[t, C] = ode45('HW1file21', tspan, Co);    % for "ode45" solver 

for i = 1:41                    
    Cana(i,:) = HW1file23ana(t(i));
end

% Plot the results on the same figure.
plot (t, C(:,1), '-',t, C(:,2), '-', t, Cana(:,1),'o',t,Cana(:,2),'o'), title ('Concentration vs Time'), ...
legend ('C_A', 'C_R', 'C_Aa', 'C_Ra'), xlabel ('t, min'), ylabel ('C_A (M), C_R (M), C_Aa (M), C_Ra (M)');
