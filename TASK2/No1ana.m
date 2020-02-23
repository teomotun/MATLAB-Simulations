function X = No1ana(t)
   
global k Cbo Vo vo V1 t1 Nb1
   
        
if (t < t1)
    X(1) = Vo + vo*t;
    X(2) = ((vo * Cbo)./k)*(1-exp(-k*t));
    X(3) = (vo * Cbo)*(t + 1/k.*(exp(-k*t)-1));
end

if (t >= t1)
    X(1) = V1;
    X(2) = Nb1*exp(-k*(t-t1));
    X(3) = (vo * Cbo)*(t1 - 1/k.*(1-exp(-k*t1))*exp(-k*(t-t1)));
end

X = [X(1) X(2) X(3)]
