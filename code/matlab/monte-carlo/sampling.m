N_samples = 1e6;
pi = @(x) exp(-abs(x));
A = @(x,y) min(1, pi(x) / pi(y));
samples = zeros(N_samples,1);
for i = 1:N_samples
    xstar = samples(i) + (2*rand(1) - 1);
    if (rand(1) < A(xstar, samples(i)))
        samples(i+1) = xstar;
    else
        samples(i+1) = samples(i);
    end
end