function dY = No1deriv(t,Y)
   
global k Cbo Vo vo V1 t1 Nb1
   
        
if (t < t1)
    dV = vo;
    dNb = vo * Cbo - k * Y(2);
    dNr = k * Y(2);

end

if (t >= t1)
    dV = 0;
    dNb = - k * Y(2);
    dNr = k * Y(2);
end

dY = [dV; dNb; dNr];