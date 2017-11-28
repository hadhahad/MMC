function Int = utShoot(N)
% Vypocet integralu funkce f(x) = x^2 - 2x + 1
%
% INPUT 
%   N .. pocet vzorku pro vypocet jednoho integralu
%
% OUTPUT
%   I .. hodnota integralu

if nargin < 1, N = 10000; end
MIN = 0;
MAX = 16;
ry = ctZaklSpoj(N,'CONST',[0,16]);
rx = ctZaklSpoj(N,'CONST',[-3,1]);

zasah = ry < rx.*rx - 2*rx + 1;   % tecka " .* " - nasobeni po prvcich

Int = 4*16 * mean(zasah);

end