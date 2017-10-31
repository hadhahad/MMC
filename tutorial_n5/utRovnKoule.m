function X = utRovnKoule(N,dim)
% funkce na generovani rovnomerneho rozdeleni 
% na dim-dimenzionalni kouli
%
% INPUT
%   N .. pocet realizaci
%   dim .. dimenze koule
X = nan(N,dim);
pocUsp = 0;

while pocUsp < N
    r = ctZaklSpoj(dim,'CONST',[-1,1]);
    if vMnozine(r)
        pocUsp = pocUsp + 1;
        X(pocUsp,:) = r;
    end
end

end

function flag = vMnozine(r)

flag = norm(r) < 1;

end