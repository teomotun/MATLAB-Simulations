% Matlab command file H4P2.m to solve numerically the differential equation
%
%          dH     vo
%          -- = ------         for   t < t1 = pi*R^2*(H1 - Ho)/vo
%          dt   pi*R^2
%
%               vo - a*H
%             = --------       for   t => t1 = pi*R^2*(H1 - Ho)/vo
%                pi*R^2
%
%          at t = 0, H = Ho
%
% Parameter values:  vo = 10.0 L/s = 0.60 m^3/min
%                    R = 10 m,  H1 = 0.50 m,  Ho = 0.25 m
%                    a1 = 1000 L/(m.min) = 1.0 m^3/(m.min) 
%                    a2 = 1500 L/(m.min) = 1.5 m^3/(m.min)
%
% The analytical soln is given by
%
%            vo*t
% Ha = Ho + ------                    for   t < t1 = pi*R^2*(H1 - Ho)/vo
%           pi*R^2
%
%      vo         vo     -a(t - t1)
% Ha = -- + [H1 - --]exp[----------]  for   t => t1 = pi*R^2*(H1 - Ho)/vo
%       a          a       pi*R^2
%

clc
clf
clear
global a1 a2 R vo t1 Ho H1

a1 = 1.0;                  % m^3/(m.min)
a2 = 1.5;                  % m^3/(m.min
R = 10.0;                  % m
vo = 0.60;                 % m^3/min

Ho = 0.25;                 % m
H1 = 0.50;                 % m
t1 = pi*R^2*(H1 - Ho)/vo;  % min
t0 = 0;                    % min
tf = 250;                  % min
tspan = [t0 tf];

H0 = [Ho Ho];

% Solve the above differential equation numerically using the "ode15s" solver
% which is more suited for solving a stiff differential equation (or a system of
% differential equations than the "ODE45" solver. The derivative functions of
% differential equations are defined in a user-created file called H4P2dv.m.
% Here t is a column vector containing the incremental time in min and H 
% is a two-column matrix containing the corresponding height of the water
% level in the reservoir in m.  The first column in H contains the water- 
% level height for various times corresponding to a1 = 1.0 m^3/(m.min) 
% while the second column in H contains the water-level height for various
% times corresponding to a2 = 1.5 m^3/(m.min). We could have solved for the two
% cases corresponding to a1 and a2 separately, but it is more efficient to solve
% them simultaneously and compare the results on the same plot.  In order to
% solve the two cases simultaneously, we have to use a matrix with two columns
% instead of a vector.


[t, H] = ode15s('H4P2dv', tspan, H0); 

% Number of elements in t vector = 20
% Find the numerical results of the corresponding analytical solution using 
% a "DO" loop and a user-created function named H4P2an which is contained in 
% Hw2P2an.m file. The number of step in the "DO" loop--20--is determined from 
% the number of elements in the t vector. The latter (as well as the dimensions 
% of any other vectors or matrices) can be determined from the list of variables 
% and parameters that can be invoked by the command 'whos';  the list will show 
% the dimensions of all variables and parameters, including the t vector.

  for i = 1:20               % a better option is "for i = 1:length(t)"
     Ha(i,:) = H4P2an(t(i));
  end


% Plot the results on the same figure.

  plot (t, H(:,1), '-', t, H(:,2), '--', t, Ha(:,1), '+', t, Ha(:,2), '*'),...
      title ('Water Level vs. Time'), legend ('H1', 'H2', 'Ha1','Ha2'),...
      xlabel ('t(min)'), ylabel ('H(m)');
