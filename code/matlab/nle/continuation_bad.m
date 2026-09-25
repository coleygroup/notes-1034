function xs = continuation_bad(h, dh, x0, lambdas, tol, maxit)
% Trace the solution of h(x,lambda) = 0 as lambda varies.
    xs = zeros(numel(x0), numel(lambdas));

    for i = 1:numel(lambdas)
        lam = lambdas(i);
        x   = x0;
        for k = 1:maxit
            r = h(x, lam);
            if norm(r) <= tol
                break
            end
            x = x - dh(x, lam) \ r;
        end
        xs(:, i) = x;
    end
end
