function NV = utNorm(N, presnost)
% funkce na generovani normalniho rozdeleni
%
% INPUT
%   N .. pocet realizaci
%   presnost .. presnost metody
%
% OUTPUT
%   NV .. realizace

% presnost = 12 -> N(0,1)

NV = sum(rand(presnost,N))-presnost/2;

end