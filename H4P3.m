% Matlab command file H4P3.m to solve numerically the first-order differential 
% equations governing the concentration of reactant B in a mixed-flow reactor as 
% a function of time t: 
%
% dCB    vo(CBo - CB)
% --- = ---------------                   
% dt    Vo + (vo - v')t 
%
% with the initial conditions:
%
% at t = 0, CB* = 0.50 M.
%
% The analytical solution is given by
%
%                         CBo - CB*          
% CB(t) = CBo - -----------------------------
%                    (vo - v')t  vo/(vo - v')
%               [1 + -----------]
%                        Vo
%
% It is desired to use Matlab to solve numerically the differential equations 
% and to compare the Matlab results with the corresponding numerical results
% of the analytical solutions for the following set of parameter values: Vo = 
% 50 L,  vo = 15 L/min, v' = 9 L/min, CBo = 1.0 M, and CB* = 0.50 M over the 
% time interval 0-10 min.
%
    clc
    clf
    clear
    global Vo vo vprime CBo CBstar

    Vo = 50;          % L
    vo = 15.0;        % L/min
    vprime = 9;       % L/min
    CBo = 1.0;        % M
    CBstar = 0.50;    % M
    
    to = 0;           % min
    tf = 10;          % min
    tspan = [to tf];

% Solve the above differential equations numerically using the "ode45" solver 
% that is based on a 4th/5th order Runga-Kutta-Fehlberg method. The derivative
% functions of the differential equations are defined in a user-created file 
% called H4P3dv.m. Here t is a column vector containing the incremental 
% time in min and CB is a vector containing the corresponding concentration 
% values of B.

    [t, CB] = ode45('H4P3dv', tspan, CBstar); 

% Find the numerical values of the corresponding analytical solution CB(t) 
% using a "DO" loop and a user-created function named H4P3an which is contained
% in the m-file called H4P3an.m. The number of steps in the "DO" loop--45--is 
% determined from the number of elements in the t vector. The latter (as well as 
% the dimensions of any other vectors or matrices) can be determined from the 
% list of variables and parameters that can be invoked by the command 'whos';  
% the list will show the dimensions of all variables and parameters, including 
% the t vector.

  for i = 1:45                  % a better option is "for i = 1:length(t)"
        CBa(i) = H4P3an(t(i));
  end
     
% Plot the Matlab and analytical results on the same figure for comparison.

  plot (t, CB(:), '-', t, CBa(:), '*'), legend ('CB', 'CBa'),...
        title ('CB(t) vs. Time'), xlabel ('t, min'), ylabel ('CB, M');
