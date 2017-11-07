function NV = utUnif(N, param)
% funkce na generovani uniformniho rozdeleni
%
% INPUT
%   N .. pocet realizaci
%   param .. parametry metody
%
% OUTPUT
%   NV .. realizace

a = param(1);
b = param(2);
c = param(3);

NV = nan(N);

x = (now - today)*24*60*60;
for i= 1:N
    x = a+b*mod(x,c);
    NV(i) = x;
end

end