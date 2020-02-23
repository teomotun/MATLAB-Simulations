function Can = HW1file23ana(t)

  global Cao k Vo v tau Castar Crstar

  Caa = (Cao/(1+0.5*k*tau))-((Cao/(1+0.5*k*tau))-Castar)*exp(-(1+0.5*k*tau)*(t/tau));
  
  Cra = ((0.5*k*tau*Cao)/(1+0.5*k*tau))+((Cao/(1+0.5*k*tau))-Castar)*exp(-(1+0.5*k*tau)*(t/tau));

  Can = [Caa Cra];