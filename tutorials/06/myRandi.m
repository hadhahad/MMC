function R = myRandi(N,Imax,seed)
% funkce vygeneruje zadaný pocet náhodných integeru mezi 0 a Imax(vcetne)
%
% INPUT
%   N    .. pocet generovaných císel
%   Imax .. hodnota nejvyššího císla (maximální prípustná je XX)
%
% OUTPUT
%   R .. vektor náhodných císel

if nargin < 3
    c = clock;                  % použití aktuálního casu pro init
    seed = ceil(c(6)*10000); 
end

R = nan(N,1);                   % Príprava výstupu

% k = 2^(11);                   % definice konstant
% b = 5;
% M = 87321; % peroidické    % M = 83320 % ok

k = 2^(16)+3;                   % randu
b = 87;
M = 2^(31);

R(1) = seed;
for i = 2:N                     % výpocet
    R(i) = mod(k*R(i-1)+b,M);  
end

R = mod(R,Imax+1);              % normování na požadované maximum
end





