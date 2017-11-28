function Int = utVzorek(N)
% Vypocet integralu funkce f(x) = x^2 - 2x + 1 na [-3,1]
%
% INPUT 
%   N .. pocet vzorku pro vypocet jednoho integralu
%
% OUTPUT
%   I .. hodnota integralu

if nargin < 1, N = 10000; end

f_x = nan(N);


    r_x = ctZaklSpoj(N,'CONST',[-3,1]);


    Int = mean(f_x)*4;
end