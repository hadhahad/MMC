function hody = ctMultinom(N,p)
% funkce na generovani binomickeho rozdeleni
%
% INPUT
%   N .. pocet realizaci
%   p .. vektor cetnosti 
%
% VYSTUP
%   hody .. vektor realizaci

p = p/sum(p);
p = cumsum(p);

hody = nan(N,1);

for i = 1:N

    r = rand(1);
    idx = 1;
    while r > p(idx)
        idx = idx + 1;
    end
    hody(i) = idx;
end


end