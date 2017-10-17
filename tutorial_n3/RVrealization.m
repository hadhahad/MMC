% p = [0.1,0.1,0.1,0.1,0.1,0.5];
% N = length(p);

p = 0.3;
M = 100;
N = 1000;

x = utBinom(1000,0.3,100);

hist(x,1:100);

% Poissonovo rozdeleni

y = 0:0.1:1000; % domain
n = 1;
fn = -(log(y)).^n/factorial(n);
plot(fn);
% hold on;
% x = 2;
% n = 1:100;