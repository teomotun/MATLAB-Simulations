function dT = HW1file2(t,T)
   
global rho Cp Vo vo tau Tzero To Ton Toff Qo Omega ton toff k
   
if (k==0)
    dT = (To - T)/tau;
end
        
if (T > Ton) | (k==1)
    dT = Omega - T/tau;
    k = 1;
end

if (T < Toff)
    dT = (To - T)/tau;
    k = 0;
end