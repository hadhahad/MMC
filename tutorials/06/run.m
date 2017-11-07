NV = utUnif(1000, [2,0.1,1000]);

[prum,rozp,chybaPrum] = dispStats(NV,0.01,true);

figure(1)
histogram(nahVel)
%scatter(nahVel(:,1),nahVel(:,2),'.')