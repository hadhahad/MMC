% SKRIPT pocasi
P = [
 0.3  0.6  0    0    0.1; ...
 0.4  0.5  0    0    0.1; ...
 0    0    0.4  0.5  0.1; ...
 0    0    0.4  0.5  0.1; ...
 0.25 0.25 0.25 0.25 0];


N = 100;
vysl = nan(N,1);

for i = 1:N
    vysl(i) = simPocasi(P);
end

[prum,~,maxChyba] = ctStats(100*vysl);

disp(['prumer : ' num2str(prum,'%0.2f')])
disp(['chyba prumeru : ' num2str(maxChyba,'%0.3f')])
