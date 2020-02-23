% Matlab command file H4P3Alt.m to solve numerically the system of first-order 
% differential equations governing the volume and concentration of a reactant 
% B of the solution in a mixed-flow reactor as a function of time t: 
%
%   dV
%   -- = vo - v'
%   dt
%
%   dCB    vo(CBo - CB)
%   --- = ---------------                   
%   dt    Vo + (vo - v')t 
%
% with the initial conditions:
%
% at t = 0, V= Vo and CB = CBstar = 0.50 M.
%
% The analytical solution is given by
%
%   V(t) = Vo + (vo - v')t
%
%
%                           CBo - CB*          
%   CB(t) = CBo - -----------------------------
%                      (vo - v')t  vo/(vo - v')
%                 [1 + -----------]
%                          Vo
%
% It is desired to use Matlab to solve numerically the system of differential 
% equations and to compare the Matlab results with the corresponding numerical 
% results of the analytical solutions for the following set of parameter values: 
% Vo = 50 L,  vo = 15 L/min, v' = 9 L/min, CBo = 1.0 M, and CBstar = 0.50 M 
% over the time interval 0-10 min.
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
    Y0 = [Vo, CBstar];
% Solve the above differential equations numerically using the "ode45" solver 
% that is based on a 4th/5th order Runga-Kutta-Fehlberg method. The derivative
% functions of the differential equations are defined in a user-created file 
% called H4P3dvAlt.m. Here t is a column vector containing the incremental 
% time in min and Y is a two-column matrix in which the first column corresponds 
% to the volume V vector vector and the second column corresponds to the CB vector.

    [t, Y] = ode45('H4P3dvAlt', tspan, Y0); 

% Find the numerical values of the corresponding analytical solutions Y(1) 
% (for V(t)) and Y(2) (for CB(t)) using a "DO" loop and a user-created function 
% named H4P3anAlt which is contained in the m-file called H4P3anAlt.m. The 
% number of steps in the "DO" loop--45--is determined from the number of elements 
% in the t vector. The latter (as well as the dimensions of any other vectors or 
% matrices) can be determined from the list of variables and parameters that can 
% be invoked by the command 'whos';  the list will show the dimensions of all 
% variables and parameters, including the t vector.

  for i = 1:45
        Ya(i,:) = H4P3anAlt(t(i));
  end
     
% Plot the Matlab and analytical results on the same figure for comparison.

  plot (t, Y(:,1)/50, '-', t, Ya(:,1)/50, '*', t, Y(:,2), 'o', t, Ya(:,2), '+'),...
        legend ('V/50', 'Va/50', 'CB', 'CBa'), title ('V(t)/50 & CB(t) vs. Time'),...
        xlabel ('t, min'), ylabel ('V/50 in L & CB in M');
