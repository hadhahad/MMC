function [ex, dx, err] = calcStats(rv, signLvl, verbose)
% The function for the PDE solution statistical evaluation
%
% INPUT:
%   rv .. random variable
%   signLvl .. significance level
%   verbose .. verbose parameter
%
% OUTPUT:
%   ex .. sample mean value
%   dx .. sample standard deviation value
%   err .. solution error (according to Chebyshev's inequality)

if nargin < 2 
    signLvl = 0.05; 
end

if nargin < 3 
    verbose = false; 
end

N = length(rv);

ex = mean(rv);
dx = var(rv);
sigma = sqrt(dx);
err = sigma/sqrt(N*signLvl);

if verbose
    disp(['Mean value: ' num2str(ex,'%0.4f')])
    disp(['Variance: ' num2str(dx,'%0.4f')])
    disp(['Error: ' num2str(err,'%0.4f')])
end

end