% Matlab command file H4P5.m to solve numerically the following first-order 
% differential equation governing the molar concentration CA of reactant A 
% in a batch-reactor solution.
%
%     dCA         k*K*CEo*CA
%     --- = -rA = ----------
%     dt           1 + K*CA
%
% with the initial conditions: at t = 0, CA = CAo.
%                                          CAo
% The analytical solutions are given by ln---- + K*(CAo - CA) = k*K*CEo**t
%                                          CA%
% It is desired to use Matlab to solve numerically the differential equation 
% and to compare the Matlab results with the corresponding numerical results
% of the analytical solution for the following set of parameter values under 
% ambient condition, i.e., T = 25oC and P = 1.0 atm: CAo = 1.0 M, 
% CEo = 5.0 g/L, k = 0.0133 mol/(g.min), K = 5.081/M ver the 0-30 min period
%
    clc
    clf
    clear
    global CAo CEo k K
 
    CAo = 1.0;             % M
    CEo = 5.0;             % g/L
    k = 0.0133;            % mol/(g.min)
    K = 5.081;             % 1/M
    to = 0;                % min
    tf = 30;               % min
    tspan = [to tf];       % min min
 
% Solve the above differential equations numerically using the "ode45" 
% solver that is based on a 4th/5th order Runga-Kutta-Fehlberg method.
% Here t is a column vector containing the incremental time in min and 
% we will use a two-column matrix Y to contain the volume vector V (in 
% L) in the first column and the mole number vector NB (in g-mols) in 
% the second column, i.e., we will let Y(1) = V and Y(2) = NB.  The 
% derivative functions of the differential equations are defined in 
% SM1dv.m.
 
   [t, CA] = ode45('H4P5dv', tspan, CAo);
 
% Use a "DO" loop to generate the analytical concentration-time profile. 
% Because of the form of the analytical solution, it is easier to calculate
% the analytical time, ta, corresponding to a concentration value rather 
% than the other way around.  In order to calculate the analytical 
% concentration for a given time value from the analytical expression, it 
% would be necessary to use a trial-and-error, which would be laborious and
% cumbersome. The analytical time ta is calculated in a "DO" loop using an 
% analytical function file called H4P5an.m. The number of steps in the "DO" 
% loop--69--is determined from the number of elements in the t vector. The 
% latter (as well as the dimensions of any other vectors or matrices) can 
% be determined from the list of variables and parameters that can be 
% invoked by the command 'whos'; the list will show the dimensions of all 
% variables & parameters, including the t vector.
 
  for i = 1:41                 % a better option is "for i = 1:length(t)"
      ta(i) = H4P5an(CA(i));
  end
 
% Plot the Matlab and analytical results on the same figure for comparison. 
  plot (t, CA, '-',ta, CA,'*'), xlabel ('t, min'), title ('CA vs t'),...
         ylabel ('CA, CAa'), legend ('CA','CAa');  
