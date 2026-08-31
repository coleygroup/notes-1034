k = 10;
lambda = 5;
x = 5;

sum_terms = 0;
for n = 0:(k-1)
    sum_terms = sum_terms + (lambda*x)^n / factorial(n);
end

F_X = 1 - exp(-lambda*x) * sum_terms