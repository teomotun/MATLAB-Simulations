function dC = HW1file21(t,C)
global Cao k Vo v tau

dCa = 1/tau*(Cao) - (1/tau + 0.5*k).*C(1);
dCr = 0.5*k*C(1) - 1/tau * C(2);

dC = [dCa; dCr];