function X = ctZaklSpoj(N,model,param)
% funkce na generovani N realizaci NV daneho modelu
%
% INPUT
%   N .. pocet realizaci
%   model .. string popisujici model : 'CONST','LIN'
%   param .. parametry modelu
%
% Modely:
%   'CONST'  .. konstantni hustota na (a,b), param: [a,b] 
%   'LIN'    .. linearni hustota na (a,b), param: [a,b] 
%   'CAUCHY' .. centrovana cauchyho hustota, param: [a] 
%   'PULKRUH' .. pulkruh pomoci zamitaci metody, param: [a]

switch model
    case 'CONST' 
        a = param(1);
        b = param(2);
        X = (b-a)*rand(N,1) + a;
    case 'LIN'
        a = param(1);
        b = param(2);
        X = a + sqrt(rand(N,1))*(b-a);
    case 'CAUCHY'
        a = param(1);
        X = tan(pi*(rand(N,1)-1/2))-a;
    case 'PULKRUH'
        a = param(1);
        x_1 = a-1 + (2).*rand(N,1);
        x_2 = rand(N,1);
        X = x_1+x_2; 
end

end