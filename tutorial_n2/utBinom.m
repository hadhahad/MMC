function hody = utBinom(n,p,M)
% Funkce na generovani 'n' realizaci binomicke 
% nahodne veliciny s parametrem 'p'.
%
%  INPUT
%   n .. pocet realizaci
%   p .. Pr[x=1]
%   M .. pocet pokusu
%
%  OUTPUT
%   hody .. realizace

%%%%%% Neelegantni implementace

% hody = nan(n,1);
% 
% for i= 1:n
%     r = rand(M,1);
%     hody(i) = sum(r<p);
% end

%%%%%% Maticove

% r = rand(M,n);
% x = r < p;
% hody = sum(x,1);

%%%%%% Elegantni implementace

warning('off','MATLAB:nchoosek:LargeCoefficient');

hody = nan(n,1);
prst = nan(M+1,1);

for k = 1:M+1
    prst(k) = nchoosek(M,k-1)*p^(k-1)*(1-p)^(M-k+1);
end
prst = cumsum(prst);

r = rand(n,1);
for j = 1:n
    idx = 1;
    while r(j) > prst(idx)
        idx = idx + 1;
    end
    hody(j) = idx;
end

warning('on','MATLAB:nchoosek:LargeCoefficient');
end