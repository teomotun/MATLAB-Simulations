% Derivative function file ex1drv.m for the command file ex1.m.
    function dH = U16H4P1dv(t,H)
    global Ho Ro a1 a2 Ao
    dH1 = - a1*H(1)/Ao;
    dH2 = - a2*sqrt(H(2))/Ao;
    dH = [dH1; dH2];

