% Derivative function file H4P3dv.m for the command file H4P3.m.
    
    function dCB = H4P3dv(t,CB)
    
    global Vo vo vprime CBo CBstar
    
    dCB = vo*(CBo - CB)/(Vo + (vo - vprime)*t);
    