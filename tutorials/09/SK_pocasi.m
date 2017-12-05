% SKRIPT pocasi
P = [
 0.3  0.6  0    0    0.1; ...
 0.4  0.5  0    0    0.1; ...
 0    0    0.4  0.5  0.1; ...
 0    0    0.4  0.5  0.1; ...
 0.25 0.25 0.25 0.25 0];

% poc = 3;
% cil = NaN;
% cas =  100;
% sim = 10000;
% [~,vyvoj] = simPocasi(poc,cil,cas,P,sim);
% budStav = vyvoj(:,end);
% figure(1)
% histogram(vysl);

cas = 100;
prst = [0 0 1 0 0]';
casHor = 20;
P_n = P^casHor;

prst = P_n*prst;

bar((1:5),prst);