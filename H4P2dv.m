function dH = H4P2dv(t,H)
global a1 a2 R vo t1 Ho H1

if t < t1
   dH1 = vo/(pi*R^2);
   dH2 = vo/(pi*R^2);
else
   dH1 = (vo-a1*H(1))/(pi*R^2);
   dH2 = (vo-a2*H(2))/(pi*R^2);
end

dH = [dH1; dH2];
