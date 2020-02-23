% Derivative function file H4P3dvAlt.m for the command file H4P3Alt.m.
    
    function dY = H4P3dvAlt(t,Y)
    
    global Vo vo vprime CBo CBstar
    dV = vo - vprime; 
    dCB = vo*(CBo - Y(2))/(Vo + (vo - vprime)*t);
    dY = [dV; dCB];
    