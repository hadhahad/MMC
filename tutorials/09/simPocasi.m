function prstUsp = simPocasi(P)

pocSym = 1000;
pocatek = 4;
cilenyStav = 2;
casHor = 3;

pocUspechu = 0;

for j = 1:pocSym
    aktStav = pocatek;
    for i = 1:casHor
        aktStav = ctMultinom(1,P(aktStav,:));
        if aktStav == cilenyStav
            pocUspechu = pocUspechu+1;
         %   disp(['uspech v kroku: ' num2str(j)])
            break
        end
    end
end

prstUsp = pocUspechu/pocSym;

end