% script pro testovani hazeni minci 


N = 1000;
p = 0.6;    % cinkla mince
hladVyzn = 0.01;
 
% hod = randi(2,N,1)-1; % necinkla mince
% hod = rand(N,1)<p; % nebo randi(10,N,1)<=10*p

hod = utBinom(N,p);
dispStats(hod,hladVyzn);

text = 'lalka';
cislo = 17.23213;
hladVyzn = 0.01;disp([text ':' num2str(cislo,'%0.1f') ' ' text])

% Nyni chceme max chybu 0.001 

p = 0.6;
maxChyba = 0.001;
hlVyzn = 0.01;

hod = utBinom(1,p);
[EX, sigma, err] = dispStats(hod);
while err > maxChyba
    hod = [hod, utBinom(1,p)];
    [EX, sigma, err] = dispStats(hod);
end