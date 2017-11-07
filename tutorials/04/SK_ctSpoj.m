%SK: generovani spojitych velicin

% nahVel = ctZamSpoj(100000,'PULKRUH',2);
nahVel = utRovnKoule(10000,2);

[prum,rozp,chybaPrum] = dispStats(nahVel,0.01,true);

figure(1)
%histogram(nahVel,0:0.-2:2)
scatter(nahVel(:,1),nahVel(:,2),'.')