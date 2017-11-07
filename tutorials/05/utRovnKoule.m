function X = utRovnKoule(N,dim)
% funkce na generování rovnom?rného rozd?lení
% na K-dimenzionální kouli

X = nan(N,dim);
pocUsp = 0;

while pocUsp < N
    r = ctZaklSpoj(dim,'CONST',[-1,1]); % výstrel do prostoru            
    if vMnozine(r)                      % zásah do cílené podmnoiny
        pocUsp = pocUsp+1;
        X(pocUsp,:) = r;
    end
end


end

function flag = vMnozine(r)
    flag = norm(r) < 1;
end