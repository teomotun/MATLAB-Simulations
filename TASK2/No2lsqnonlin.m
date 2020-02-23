function No2lsqnonlin
lb = [0 0 0 0 0];  % lower limit
ub = [4 4 4 4 4]; % upper limit
F0 = [1 1 1 1 1]; % guess values
options=optimset('Display','iter'); % Option to display output
[F,resnorm,residual,exitflag,output] = lsqnonlin(@No2main, F0, lb, ub)
end

% F = 1.5388    0.4612    0.4125    0.9513     0.0974
% 
% resnorm =
% 
%    4.7920e-11
% 
% 
% residual =
% 
%    1.0e-05 *
% 
%    -0.0781
%     0.0400
%     0.0014
%     0.0583
%     0.6842
% 
% 
% exitflag =
% 
%      1
% 
% 
% output = 
% 
%   struct with fields:
% 
%     firstorderopt: 8.7369e-07
%        iterations: 7
%         funcCount: 48
%      cgiterations: 0
%         algorithm: 'trust-region-reflective'
%          stepsize: 0.0023
%           message: 'Local minimum found.??Optimization completed because the size of the gradient is less than?the default value of the optimality tolerance.??Stopping criteria details:??Optimization completed: The first-order optimality measure, 8.736927e-07,?is less than options.OptimalityTolerance = 1.000000e-06.??Optimization Metric                                       Options?relative first-order optimality =   8.74e-07  OptimalityTolerance =   1e-06 (default)'
