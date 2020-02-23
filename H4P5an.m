% Analytical function file H4P5an.m for the command file H4P5.m. The 
% natural log function is log( ) NOT ln( )! 
  function ta = H4P5an(CA)
  global CAo CEo k K
  ta = (log(CAo/CA) + K*(CAo - CA))/(k*K*CEo);
 

