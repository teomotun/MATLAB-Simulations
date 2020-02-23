% Analytical function file H4P6an.m for the command file H4P6.m.

  function Ta = H4P6an(t)

  global m Mstar Tstar To Ws UA Ts Cp Teta Phi
  
  Ta = Teta/Phi - (Teta/Phi - Tstar)*exp(-Phi*t);
