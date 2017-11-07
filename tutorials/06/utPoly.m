function X = utPoly(N, deg)
% funkce na generovani polynomialniho rozdeleni
%
% INPUT
%   N .. pocet realizaci
%   deg .. stupen polynomu
%
% OUTPUT
%   X .. realizace

X = max(rand(deg+1,N));

end