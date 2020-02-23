clc
clf
clear
global Cao k Vo v tau

k = 0.04;               %min^-1
Vo = 1000;              %L
Cao = 1;                %M
v = 25;                 %L/min
tau = Vo/v;
 
t0 = 0;
tf = 100;
tspan = [t0 tf];
 
[t, C] = ode45(HW1file21, tspan, Cao);    % for "ode45" solver 
  
%   for i = 1:45                    
%       Ta(i) = HW1file3ana(t(i));
%   end
plot(t,C(1),C(2))
% Plot the results on the same figure.
% plot (t, T(:), '-', t, Ta(:), 'o'), title ('T vs t'), ...
%egend ('T', 'Ta'), xlabel ('t, min'), ylabel ('T (oC), Ta (oC)');
