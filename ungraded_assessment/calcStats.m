function [ex, dx, err] = calcStats(rv, signLvl, verbose)
% Funkce na vyhodnoceni zakladnich statistik

if nargin < 2, signLvl = 0.05; end
if nargin < 3, verbose = false; end

N = length(rv);

ex = mean(rv);
dx = var(rv);
sigma = sqrt(dx);
err = sigma/sqrt(N*signLvl);

if verbose
    disp(num2str(ex,'%0.4f'))
    disp(num2str(dx,'%0.4f'))
    disp(num2str(err,'%0.4f'))
end

end