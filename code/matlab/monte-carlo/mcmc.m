function samples = MCMC(g, x0)
  M = 100000;
  samples = zeros(1, M);
  samples(1) = x0;
  j = 2;
  while j <= M
    proposal = samples(j-1) + 2*rand()-1;
    u = rand();
    if u < min(1, g(proposal)/g(samples(j-1)))
      samples(j) = proposal;
    else
      samples(j) = samples(j-1);
    end
    j = j + 1;
  end
end

g = @(x) 0; % ???
f = @(x) 0; % ???
samples = MCMC(g, 0);
mean(f(samples))