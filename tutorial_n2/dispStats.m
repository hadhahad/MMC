function [prum, rozp, chybaPrum] = dispStats(nahv, hlVyzn, verbose)
% Funkce na vyhodnoceni zakladnich statistik

if nargin < 2           % pocet vstupnich argumentu
        hlVyzn = 0.01;
end
if nargin < 3, verbose = true; end

N = length(nahv);

prum = mean(nahv);
rozp = var(nahv);
chybaPrum = rozp/sqrt(N*hlVyzn);

if verbose
    disp(num2str(prum,'%0.4f'))
    disp(num2str(rozp,'%0.4f'))
    disp(num2str(chybaPrum,'%0.4f'))
end

end