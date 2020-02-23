% Derivative function file Hw2P4drv.m for the command file U15CHE225H4P4.m.
    
    function dY = U15CHE225H4P4dv(t,Y)

    global vo Vstar CBo CBstar k

    dV = vo;
       
    dNB = vo*CBo - k*Y(2);

    dY = [dV; dNB];
