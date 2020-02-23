function y = H4P2an(t)

global a1 a2 R vo t1 Ho H1

if t < t1
   y(:,1) = Ho + vo*t/(pi*R^2);
   y(:,2) = Ho + vo*t/(pi*R^2);
else
   y(:,1) = vo/a1 + (H1 - vo/a1)*exp(-a1*(t - t1)/(pi*R^2));
   y(:,2) = vo/a2 + (H1 - vo/a2)*exp(-a2*(t - t1)/(pi*R^2));
end