% Matlab command file H4P6.m to solve numerically the differential equation 
% governing the temperature (T) of water in a heated tank:
%
%        dT    m*Cp*To + UA*Ts + Ws    m*Cp + UA
%        -- = (--------------------) - ---------T = Teta - Phi*T
%        dt           (M*)Cp             (M*)Cp
%
%                m*Cp*To + UA*Ts + Ws
%        Teta = (--------------------) 
%                      (M*)Cp        
%
%              m*Cp + UA
%        Phi = ---------
%               (M*)Cp
%
% with the initial condition: at t = 0, T = T*.
%
% The analytical solution is given by
%
%            Teta    Teta   
%     T(t) = ---- - [---- - T*]exp(-Phi*t)
%            Phi     Phi       
%
% It is desired to use Matlab to solve numerically the differential equation and
% to compare the Matlab results with the corresponding numerical results of the 
% analytical solution for the following set of parameter values: m = 5 kg/min, 
% M* = 25 kg, T* = 30oC, To = 20oC, Ws = 2.0 kcal/min, UA = 2.0 kcal/(min.oC), 
% Ts = 200oC, and Cp = 1.0 kcal/(kg.oC) over the time period 0-20 min
%
    clc
    clf
    clear
    global m Mstar Tstar To Ws UA Ts Cp Teta Phi

    m = 5.0;               % kg/min
    Mstar = 25.0;          % kg
    Tstar = 30.0;          % oC
    To = 20.0;             % oC

    Ws = 2.0;              % kcal/min
    UA= 2.0;               % kcal/(min.oC)
    Ts = 200;              % oC
    Cp = 1.0;              % kcal/oC.kg

    Teta = (m*Cp*To + UA*Ts + Ws)/(Mstar*Cp); 
    Phi = (m*Cp + UA)/(Mstar*Cp);
    
    to = 0;                % min
    tf = 20.0;             % min
    tspan = [to tf];       % min min

% Solve the above differential equation numerically using the "ode45" solver 
% that is based on a 4th/5th order Runga-Kutta-Fehlberg method.  Here t is a 
% column vector containing the incremental time in minute and T is a column 
% vector containing the corresponding temperature in oC.  The derivative 
% function of the differential equation is defined in Hw2P5drv.m.

    [t, T] = ode45('H4P6dv', tspan, Tstar); 

% Use a "DO" loop in conjunction with an analytical function file called 
% H4P6an.m to calulate the numerical results of the corresponding analytical 
% solution Ta.  The number of steps in the "DO" loop--45--is determined from 
% the number of elements in the t vector. The latter (as well as the dimension
% of any other vector or matrix) can be determined from the list of variables 
% and parameters that can be invoked by the command 'whos'; the list will show 
% the dimensions of all variables and parameters, including the t vector.

    for i = 1:45               % a better option is "for i = 1:length(t)"   
        Ta(i) = H4P6an(t(i));
    end

% Plot the Matlab and analytical results on the same figure for comparison.

  plot (t, T(:), '-', t, Ta(:), '*'), xlabel ('t, min'), ylabel ('T, oC'),...
	   legend ('T', 'Ta'), title ('Plot of T(t) vs t');
