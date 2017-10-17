function x = utAltern(N,p)
% Funkce na generovani 'n' realizaci alternativni 
% nahodne veliciny s parametrem 'p'.
%
%  INPUT
%   N .. pocet pokusu
%   p .. Pr[x=k]
%
%  OUTPUT
%   x .. realizace
disp('Generování náhodné veličiny.');
tic % mereni casu

% p = p/sum(p);
% p = cumsum(p);

x = rand(N,1) < p;

disp('Generování ukončeno.');
toc  % podiva se, kdy byl posledni tic
end