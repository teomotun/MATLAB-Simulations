% Analytical function file H4P3anAlt.m for the command file H4P3Alt.m.
%
%   V(t) = Vo + (vo - v')t
%
%                           CBo - CB*          
%   CB(t) = CBo - -----------------------------
%                      (vo - v')t  vo/(vo - v')
%                 [1 + -----------]
%                          Vo

  function Ya = H4P3anAlt(t)
  global Vo vo vprime CBo CBstar
  Ya(1) = Vo + (vo - vprime)*t;
  Ya(2) = CBo - (CBo - CBstar)/(1 + (vo - vprime)*t/Vo)^(vo/(vo - vprime));
