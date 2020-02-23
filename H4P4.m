% Matlab command file U15CHE225H4P4.m to solve numerically the following 
% pair of first-order differential equations governing the volume (V) and 
% mole number of B (NB) of a reactor solution.  
%     dV     
%     -- = vo
%     dt    
%
%     dNB
%     --- = vo*CBo - k*NB
%     dt
%
% with the initial conditions: at t = 0, V = V*  and  NB = NB* = V*CB*.
%
% The analytical solutions are given by
%
%     V(t) = V* + vo*t
%    
%             vo*CBo    vo*CBo             
%     NB(t) = ------ - [------- - V*CB*]exp(-k*t)
%               k          k
%
%             NB(t)        1      vo*CBo    vo*CBo
%     CB(t) = ----- = -----------{------ - [------ - V*CB*]exp(-k*t)}
%              V(t)   (V* + vo*t)    k         k
%
% It is desired to use Matlab to solve numerically the differential equations 
% and to compare the Matlab results with the corresponding numerical results of 
% the analytical solution for the following set of parameter values: V* = 20 L, 
% vo = 10.0 L/min, CBo = 2.0 M, CBstar= 0.10 M, and k = 0.5/min over the time 
% period 0-50 min.
%
    clc
    clf
    clear
    global vo Vstar CBo CBstar k

    vo = 10.0;                % L/min
    Vstar = 20.0;             % L
    CBo = 2.0;                % M or mol/L
    CBstar = 0.10;            % M or mol/L
    NBstar = Vstar*CBstar;    % mol
    k = 0.5;                  % 1/min
    
    to = 0;                   % min
    tf = 50;                  % min
    tspan = [to tf];          % min min
    Y0 = [Vstar NBstar];      % L mol

% Solve the above differential equations numerically using the "ode45" 
% solver that is based on a 4th/5th order Runga-Kutta-Fehlberg method.
% Here t is a column vector containing the incremental time in min and 
% we will use a two-column matrix Y to contain the volume vector V (in 
% L) in the first column and the mole number vector NB (in g-mols) in 
% the second column, i.e., we will let Y(1) = V and Y(2) = NB.  The 
% derivative functions of the differential equations are defined in 
% U15CHE225H4P4dv.m.

    [t, Y] = ode45('U15CHE225H4P4dv', tspan, Y0); 

% Use a "DO" loop to calculate the Matlab concentration by dividing the 
% Matlab mole number by the Matlab volume, i.e., CB = NB/V = Y(2)/Y(1).
% Alternatively, one could also have let Matlab solve CB directly by 
% letting it solve a system of three differential equations instead of 
% the two above.  The third differential equation would then be provided 
% by the diffrential equation on CB, i.e.,
%
% dCB   vo       vo
% --- = --CBo - (-- + k)CB
% dt    V        V
%
% One would then use a three-column Y to contain the volumn vector in
% the first column, the mole number vector in the second column and the
% conncentration vector in the third column, i.e., Y(1) = V, Y(2) = NB,
% and Y(3) = CB.
%
% Use the same "DO" loop in conjunction with an analytical function file 
% called U15CHE225H4P4an.m to calulate the numerical results of the 
% corresponding analytical solutions, denoted by Ya with Ya(1) = Va and 
% Ya(2) = NBa. The number of steps in the "DO" loop--69--is determined from
% the number of elements in the t vector. The latter (as well as the 
% dimensions of any other vectors or matrices) can be determined from the 
% list of variables and parameters that can be invoked by the command 'whos';  
% the list will show the dimensions of all variables and parameters,
% including the t vector.

    for i = 1:69                   % a better option is "for i = 1:length(t)"
        CB(i) = Y(i,2)/Y(i,1);
        Ya(i,:) = U15CHE225H4P4an(t(i));
        CBa(i) = Ya(i,2)/Ya(i,1);
    end

% Plot the Matlab and analytical results on the same figure for comparison.

  plot (t, Y(:,1)/10, '-',t, Ya(:,1)/10,'*', t, Y(:,2), 'o',t, Ya(:,2),'+',...
        t, 50*CB(:), '--',t, 50*CBa(:),'-+'), xlabel ('t, min'),...
        title ('V, NB & CB vs t'), ylabel ('V/10, Va/10, NB, NBa, 50*CB, 50*CBa'),...
        legend ('V/10', 'Va/10', 'NB', 'NBa', '50*CB','50*CBa');  
