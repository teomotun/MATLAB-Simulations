function dH = H4P1dv(t,H)
global a1 a2 R Ho

   dH1 = -a1*H(1)/(pi*R^2);
   dH2 = -a2*sqrt(H(2))/(pi*R^2);

dH = [dH1; dH2];
