%% POISSON

N = 100;
fn = nan(N,1);
x = 2;

for i = 1:N
    fn(i) = -(log(x)).^n/factorial(n);
end

plot(fn);