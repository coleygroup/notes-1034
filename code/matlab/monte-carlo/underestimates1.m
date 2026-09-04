N_samples = 1e6;
f = @(x) exp(-abs(x));
samples = -2 + 4*rand(N_samples,1);
f_vals = 4 * f(samples);
N_estimate = mean(f_vals);
fprintf('%.6f\n', N_estimate);