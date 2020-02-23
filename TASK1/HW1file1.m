clc
clf
clear
global rho Cp Vo vo tau Tzero To Ton Toff Qo Omega ton toff k
 
k = 0;
Vo = 4.0;
vo = 0.50;
tau = Vo/vo;
 
rho = 1.0;
Cp = 1.0;
Tzero = 8.0;
To = 18.0;
 
Ton = 12.0;
Toff = 8.0;
Qo = -6.0;
Omega = To/tau + Qo/(rho*Cp*Vo);
 
ton = tau*log((Tzero - To)/(Ton - To));
toff = ton + tau*log((Omega*tau - Ton)/(Omega*tau - Toff));
t0 = 0;
tf = 25.0;
tspan = [t0 tf];
 
[t, T] = ode45('HW1file2', tspan, Tzero);    % for "ode45" solver 
  
  for i = 1:45                    
      Ta(i) = HW1file3ana(t(i));
  end
 
% Plot the results on the same figure.
  plot (t, T(:), '-', t, Ta(:), 'o'), title ('Temperature vs time'), ...
       legend ('T', 'Ta'), xlabel ('t, min'), ylabel ('T (oC), Ta (oC)');

