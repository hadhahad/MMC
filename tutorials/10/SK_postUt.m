% model posty
% cas merime v minutach

casKrok = 5; %minut

casPoc = 0;
casKonec = 600;
pocIteraci = ceil((casKonec-casPoc)/casKrok);

pocPrepazek = 3;

stavCekarny = nan(pocIteraci+1,1); % ceil - zaokrouhleni nahoru
stavPrepazek = zeros(pocPrepazek,1);


stavCekarny(1) = 0;
for i= 1:pocIteraci
    % prichod
    pocIn = utPrichod();
    % update stavu
    stavCekarny(i) = stavCekarny(i) + pocIn;
    % odbaveni
    [pocOut, stavPrepazek] = utOdbaveni(stavPrepazek, stavCekarny(i), casKrok); 
    % update stavu
    stavCekarny(i+1) = max(stavCekarny(i)-pocOut,0);   
end

figure(1)
bar(stavCekarny);