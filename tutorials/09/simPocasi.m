function X = simPocasi(mat, pocStav, cilStav, casHor, pocCyklu)
% vypocet pravdepodobnosti v markovskem procesu
%
% INPUT
%   mat .. matice prechodu
%   pocStav .. pocatecni stav
%   cilStav .. cilovy stav
%   casHor .. casovy horizont
%   pocCyklu .. pocet cyklu
% OUTPUT
%   X .. pravdepodobnost, ze v casHor se dostaneme ze stavu pocStav do stavu cilStav

dim = size(mat);
dim = dim(1);

X = 
stav = pocStav;

for i = 1:
    stav = Multinomial(1, mat(stav,:));
end

end