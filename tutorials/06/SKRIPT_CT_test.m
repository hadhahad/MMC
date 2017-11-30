%SK ctvrtek postupne testy

Imax = 12;  % pro 15 podivné chování
N = 10000;

x = myRandi(N,Imax,12456);
%x = randi(Imax+1,N,1)-1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
histogram(x,-0.5:1:Imax+0.5)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(x(5000:5100))

utStats(x,0.01);
