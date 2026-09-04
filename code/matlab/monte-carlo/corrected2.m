N_samples = 1e6;
f = @(x) exp(-abs(x));
P = @(x) normpdf(x);
samples = randn(N_samples,1);
fP_vals = f(samples) ./ P(samples);
N_estimate = mean(fP_vals);
fprintf('%.6f\n', N_estimate);