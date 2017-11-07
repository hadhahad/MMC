function hody = Multinomial(n,p)
% Funkce na generovani 'n' realizaci 
% nahodne veliciny s parametry p_i, i = 1:N.
%
%  INPUT
%   n .. pocet realizaci
%   p .. Pr[x=x_i]
%
%  OUTPUT
%   x .. vektor realizace
disp('Generování náhodné veličiny.');
tic % mereni casu

p = p/sum(p);
p = cumsum(p);

hody = nan(N,1);

for j = 1:n
    r = rand(1);
    idx = 1;
    while r > p(idx)
        idx = idx + 1;
    end
    hody(j) = idx;
end

disp('Generování ukončeno.');
toc  % podiva se, kdy byl posledni tic
end