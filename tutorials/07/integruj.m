function integruj(pocCyklu)
% funkce zastresujici integraci
% provede vypocet integralu

int = nan(pocCyklu,1);
pocStrel = 100;
hladVyzn = 0.01;


for i = 1:pocCyklu
    % int(i) = utShoot(pocStrel);
    int(i) = utVzorek(pocStrel);
end

[mInt,~,chybaInt] = dispStats(int,hladVyzn,false);

disp(['hodnota integralu je ' num2str(mInt) ' +- ' num2str(chybaInt)])


end

