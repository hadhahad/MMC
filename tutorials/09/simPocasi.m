function [prstUsp, casVyvoj] = simPocasi(pocStav, cilenyStav, casHor, P, pocSym)
% Simulace pocasi jako Markovskeho procesu
% 
% INPUT:
%   P .. matice prechodu
% OUTPUT:
%   prstUsp .. pravdepodobnost uspechu

if nargin < 5, pocSym = 1000; end

pocUspechu = 0;
casVyvoj = nan(pocSym, casHor+1);

for j = 1:pocSym
    aktStav = pocStav;
    casVyvoj(j,1) = aktStav;
    for i = 1:casHor
        aktStav = ctMultinom(1,P(aktStav,:));
        casVyvoj(j,i+1) = aktStav;
        if aktStav == cilenyStav
            pocUspechu = pocUspechu+1;
         %   disp(['uspech v kroku: ' num2str(j)])
            break
        end
    end
end

prstUsp = pocUspechu/pocSym;

end