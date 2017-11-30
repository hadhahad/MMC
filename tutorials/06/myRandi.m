function R = myRandi(N,Imax,seed)
% funkce vygeneruje zadan� pocet n�hodn�ch integeru mezi 0 a Imax(vcetne)
%
% INPUT
%   N    .. pocet generovan�ch c�sel
%   Imax .. hodnota nejvy���ho c�sla (maxim�ln� pr�pustn� je XX)
%
% OUTPUT
%   R .. vektor n�hodn�ch c�sel

if nargin < 3
    c = clock;                  % pou�it� aktu�ln�ho casu pro init
    seed = ceil(c(6)*10000); 
end

R = nan(N,1);                   % Pr�prava v�stupu

% k = 2^(11);                   % definice konstant
% b = 5;
% M = 87321; % peroidick�    % M = 83320 % ok

k = 2^(16)+3;                   % randu
b = 87;
M = 2^(31);

R(1) = seed;
for i = 2:N                     % v�pocet
    R(i) = mod(k*R(i-1)+b,M);  
end

R = mod(R,Imax+1);              % normov�n� na po�adovan� maximum
end





