%SK: generovani spojitych velicin

% nahVel = ctZamSpoj(100000,'PULKRUH',2);
% nahVel = utRovnKoule(10000,2);
nahVel = utNorm(1000, 2);

[prum,rozp,chybaPrum] = dispStats(nahVel,0.01,true);

figure(1)
histogram(nahVel)
%scatter(nahVel(:,1),nahVel(:,2),'.')