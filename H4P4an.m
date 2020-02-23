% Analytical function file U15CHE225H4P4an.m for the command file U15CHE225H4P4.m.

  function Ya = U15CHE225H4P4an(t)

  global vo Vstar CBo CBstar k

  Ya1 = Vstar + vo*t;
  
  Ya2 = (vo*CBo/k) - (vo*CBo/k - Vstar*CBstar)*exp(-k*t);

  Ya = [Ya1 Ya2];
