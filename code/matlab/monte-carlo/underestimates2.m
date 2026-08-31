N_samples = 1e6;
f = @(x) exp(-abs(x));
samples = randn(N_samples,1);
f_vals = f(samples);
N_estimate = mean(f_vals);
fprintf('%.6f\n', N_estimate);