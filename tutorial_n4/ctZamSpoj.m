function X = ctZamSpoj(N,model,param)
% funkce na generovani N realizaci NV daneho modelu
%
% INPUT
%   N .. pocet realizaci
%   model .. string popisujici model : 'LIN'
%   param .. parametry modelu
%
% Modely: 
%   'LIN'    .. linearni hustota na (a,b), param: [a,b] 

X = nan(N,1);

switch model
    case 'LIN'
        a = param(1);
        b = param(2);
        pocUsp = 0;
        while pocUsp < N
            r = ctZaklSpoj(1,'CONST',[a,b]);
            c = rand(1);                    % škálování
            if c < (r-a)*2/(b-a)^2 
                pocUsp = pocUsp+1;
                X(pocUsp) = r;
            end
        end        
end












end