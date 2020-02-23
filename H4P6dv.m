% Derivative function file H4P6dv.m for the command file H4P6.m.
    
    function dT = H4P6dv(t,T)
    
    global m Mstar Tstar To Ws UA Ts Cp Teta Phi
    
    dT = Teta - Phi*T;
    