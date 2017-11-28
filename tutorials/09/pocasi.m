

mat = [0.3 0.6 0.1 0 0; 0.4 0.5 0.1 0 0; 0 0 0.4 0.2 0.4; 0 0 0.5 0.2 0.3; 0.25 0.25 0 0.25 0.25];

N = 100;
vysl = nan(N,1);
pocStav = 4;
cilStav = 2;
casHor = 5;
pocCyklu = 1000;

for i = 1:N
    vysl(i) = simPocasi(mat, pocStav, cilStav, casHor, pocCyklu);
end

[prum,~,maxChyba] = dispStats(100*vysl);

disp(['prumer: ' num2str(prum,'%0.2f')]);
disp(['chyba prumeru: ' num2str(maxChyba,'%0.2f')]);