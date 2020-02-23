function y = HW1file3ana(tt)
   
global rho Cp Vo vo tau Tzero To Ton Toff Qo Omega ton toff k
   
if tt > toff
    a = fix(tt/toff);
    tt = tt - a*toff;
end
   
if tt < ton  
    y = To + (Tzero - To)*exp(-tt/tau);
else
    y = Omega*tau + (Ton - Omega*tau)*exp(-(tt-ton)/tau);
end

