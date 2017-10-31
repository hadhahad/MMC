%SK: generovani spojitych velicin

nahVel = ctZaklSpoj(10000,'LIN',[3,5]);

[prum,rozp,chybaPrum] = utStats(nahVel,0.01,true);

figure(1)
histogram(nahVel,0:0.1:10)
