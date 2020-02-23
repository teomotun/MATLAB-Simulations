% Analytical function file U16H4P1an.m for the command file U16H4P1.m.
    function Ha = U16H4P1an(t)
    global Ho Ro a1 a2 Ao
    Ha(1) = Ho*exp(-a1*t/Ao);
    Ha(2) = (sqrt(Ho) - a2*t/2/Ao)^2;
