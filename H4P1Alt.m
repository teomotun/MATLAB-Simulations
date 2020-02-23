% Matlab command file U16H4P1.m to solve numerically the following system 
% of two differential equations in U16CHE225H4P1
%
%    dH1      a1   
%    --- =  - ---H1         where Ao = pi*Ro^2
%    dt       Ao              
%
%    dH2      a2   
%    --- =  - ---H1^0.5       
%    dt       Ao              
%
% with the initial conditions  H1(t=0) = H2(t=0) = Ho  and the following
% parameter values: Ho = 1.0 m, Ro = 1.0 m, a1 = 0.15708 m^2/min,a2 = 0.10
% m^3/(min.m^0.5).
%
% The analytical solutions are given by     
%
%             -a1*t                         a2*t              2*Ao*Ho^0.5
% H1 = Ho*exp[-----]   and   H2 = [Ho^0.5 - ----]^2  for t <= -----------
%               Ao                          2*Ao                   a2
%

    clc
    clf
    clear
    global Ho Ro a1 a2 Ao

    Ho = 1.0;         % m
    Ro = 1.0;         % m
    Ao = pi*Ro^2;     % m2

% Take care to ensure consistent units for all the terms in the
% differential equation. A consistency check on the units at the
% start can save much time and aggravation later! 

    a1 = 0.15708;     % m2/min
    a2 = 0.100;       % m^3/(min.m^0.5)
    

    to = 0;           % min
    tf = 50;          % min
    tspan = [to tf];  % min  min
    H0 = [Ho, Ho];    % m m
    
% Solve the above system of differential equation numerically using the
% "ode45" solver that is based on a 4th/5th order Runga-Kutta-
% Fehlberg method.  There is an alternative "ode23" solver based
% on the 2nd/3rd order Runga-Kutta method that is less powerful.
% The differential equations are defined in a user-created file called 
% U16H4P1dv.m. Here t is a column vector containing the incremental time in
% min and H is a two-column matrix containing the H1 vector in the first 
% column and H2 vector in the second column, both in the m units.

    [t, H] = ode45('U16H4P1dv', tspan, H0); 

% Find the numerical results of the corresponding analytical
% solution, denoted by Ha, using a "DO" loop anda user-created
% function named ex1an which is contained in the m-file called 
% ex1an.m. The number of steps in the "DO" loop--45--is
% determined from the number of elements in the t vector. The
% latter (as well as the dimensions of any other vectors or
% matrices) can be determined from the list of variables and
% parameters that can be invoked by the command 'whos';  the list
% will show the dimensions of all variables and parameters,
% including the t vector.

    for i = 1:45                    % a better is "for i = 1:length(t)"
        Ha(i,:) = U16H4P1an(t(i));
    end

% Plot the Matlab and analytical results on the same figure for
% comparison.

    plot (t, H(:,1), '-', t, Ha(:,1), '*', t, H(:,2), 'o', t, Ha(:,2),...
          '+'), title ('Water Level vs. Time'), legend ('H', 'Ha'),... 
          xlabel ('t(min)'), ylabel ('H(m)');
