function No2fzero
F0 = [1 1 1 1 1]; % mol/h
options=optimset('Display','iter'); % Option to display output
[F,fval,exitflag_imp]= fsolve(@No2main, F0, options)
end
