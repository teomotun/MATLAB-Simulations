% F(1) = FCO2, F(2) = FCO, F(3) = FO2, F(4) = FN2, F(5) = FNO,
function G = No2main(F)
FTot = (F(1)) + (F(2)) + (F(3)) + (F(4)) + (F(5)); % mol/h
PTot = 10.0; % atm
K1 = 0.3272; % Rxn 1 eqm constant
K2 = 0.1222; % Rxn 2 eqm constant
G = [F(1) + F(2) - 2; % C balance
     3*F(1) + F(2) + 2*F(3) + F(5) - 6; % O balance
     2*F(4) + F(5) + - 2; % N balance
     F(2)*(F(3)^0.5)*(PTot^0.5)/(F(1)*(FTot^0.5)) - K1; % Rxn 1 equilibrium
     ((F(5))/(F(1)*F(3))^0.5) - K2]; % Rxn 2 equilibrium
end