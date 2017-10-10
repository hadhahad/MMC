function x = utBinom(n,p)
% Funkce na generovani 'n' realizaci binomicke 
% nahodne veliciny s parametrem 'p'.
%
%  INPUT
%   n .. pocet realizaci
%   p .. Pr[x=1]
%
%  OUTPUT
%   x .. realizace
disp('Generování binomické náhodné veličiny.');
tic % mereni casu

x = rand(n,1) < p;

disp('Generování ukončeno.');
toc  % podiva se, kdy byl posledni tic
end