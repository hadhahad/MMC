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
pocUsp = 0;
[meze, hMez] = dejMeze(model, param);


while pocUsp < N
        r = ctZaklSpoj(1,'CONST',meze);
        c = rand(hMez);                    
        if c < zamKrit(r,model,param)
            pocUsp = pocUsp+1;
            X(pocUsp) = r;
        end
end   
    
end

function y = zamKrit(r,model,param)

switch model
    case 'LIN'
        a = param(1);
        b = param(2);
        y = (r-a)*2/(b-a)^2;
    case 'PULKRUH'
        a = param(1);
        y = sqrt(1-(r-a)^2);
end
end 

function [meze,hMez] = dejMeze(model, param)
switch model
    case 'LIN'
        a = param(1);
        b = param(2);
        meze = [a,b];
    case 'PULKRUH'
        a = param(1);
        meze = [a-1,a+1];
end

hMez = 1; %skalovani

end