%Matlab command file H4P1.m to solve numerically the following two differential 
%simultaneously equations 
%
%    dH     -a                                               
%    -- = ------H    for case (a)                             
%    dt   pi*R*R                                      
%
%    dH    -a'                                               
%    -- = ------H^0.5   for   case (b)                                
%    dt   pi*R*R                                      
%
%with the initial condition  H(t=0) = Ho  and the following parameter values:
%                      
%Ho=1.0 m, Ro=1.0 m, a1=157.08 L/(m.min)=0.1571 m^2/min, a2=0.100 m2/(min.m^0.5) 
%
%The analytical solution is given by                                 
%
% H = Hoexp(-t/tau)    where tau = pi*R*R/a   for case (a) 
%
% H = [Ho^0.5 - a2*t/(2pi*R*R)]^2     for  case (b)
%

clc
clf
clear
global a1 a2 R Ho

a1 = 0.1571;      % m2/min
a2 = 0.10;        % m3/(min.m0.5)
R = 1.0;          % m
Ho = 1.00;        % m

t0 = 0;           % min
tf = 50;          % min
tspan = [t0 tf];  % min min

H0 = [Ho Ho];     % m m

% Solve the above differential equation numerically using the "ode45" solver.
% The derivative function of differential equation is defined in a user-created 
% file called H5P1dv.m.
% Here t is a column vector containing the incremental time in min and H 
% is a two-column matrix containing the corresponding height of the water
% level in the reservoir in m.  The first column in H contains the water- 
% level height for various times corresponding to a1 = 0.1571 m^3/(min.m) 
% while the second column in H contains the water-level height for various
% times corresponding to a2 = 0.10 m^3/(min.m^0.5). We could have solved for the two
% cases corresponding to a1 and a2 separately, but it is more efficient to solve
% them simultaneously and compare the results on the same plot.  In order to
% solve the two cases simultaneously, we have to use a matrix with two columns
% instead of a vector.


[t, H] = ode45('H4P1dv', tspan, H0); 

% Number of elements in t vector = 45
% Find the numerical results of the corresponding analytical solution using 
% a "DO" loop and two user-created functions contained in H4P1an.m file. The 
% number of step in the "DO" loop--45--is determined from the number of 
% elements in the t vector. The latter (as well as the dimensions of any 
% other vectors or matrices) can be determined from the list of variables 
% and parameters that can be invoked by the command 'whos';  the list will show 
% the dimensions of all variables and parameters, including the t vector.

  for i = 1:45                  % abetter option is "for i = 1:length(t)"
      Ha(i,:) = H4P1an(t(i));
  end

% Plot the results on the same figure.
  plot (t, H(:,1), '-', t, H(:,2), '--', t, Ha(:,1), '+', t, Ha(:,2), '*'),...
      title ('Water Level vs. Time'), legend ('H1', 'H2', 'Ha1','Ha2'),...
      xlabel ('t(min)'), ylabel ('H(m)');

 
