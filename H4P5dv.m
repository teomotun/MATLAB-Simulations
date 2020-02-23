% Derivative function file H4P5dv.m for the command file H4P5.m.    
    function dCA = H4P5dv(t, CA)
     global CAo CEo k K
     dCA = -k*K*CEo*CA/(1 + K*CA);
