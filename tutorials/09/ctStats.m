function [prum,rozpt,maxChyba] = ctStats(X,hv,verbose)
% funkce vycislujici statistiky
%
% INPUT
%   X .. vektor realizaci NV 
%
% VYSTUP
%   prum     .. aritmeticky prumer
%   rozpt    .. odhad rozptylu
%   maxChyba .. odhad Max chyby

if nargin < 2 || isempty(hv), hv = 0.01; end
if nargin < 3, verbose = false; end

N = length(X);

prum = mean(X);
rozpt = var(X);
maxChyba = sqrt(rozpt)/(sqrt(N*hv));

if verbose
    disp(['prumer : ' num2str(prum,'%0.2f')])
    disp(['rozptyl : ' num2str(rozpt,'%0.2f')])
    disp(['chyba prumeru : ' num2str(maxChyba,'%0.3f')])
end

end