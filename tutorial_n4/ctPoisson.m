function X = ctPoisson(n,lambda)
% funkce na generovani n realizaci 
% Poissonova rozdeleni
%
% INPUT
%   n      .. pocet realizaci
%   lambda .. parametr rozdeleni (klade real)
%
% OUTPUT
%   hody .. realizace

X = nan(n,1);
q = exp(-lambda);
for i = 1:n
    k = 0;          % jedna realizace
    gamma = rand;
    S = gamma;
    while S > q
        k = k+1;
        gamma = rand;
        S = gamma*S;
    end
    X(i) = k;
end
end