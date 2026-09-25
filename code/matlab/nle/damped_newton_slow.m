function x = damped_newton_slow(f, J, x0, tol, maxit)
    x = x0;
    for k = 1:maxit
        fx = f(x);
        if norm(fx) <= tol
            return
        end
        alpha = 1;
        while norm(f(x - alpha*(J(x) \ f(x)))) > norm(fx)
            alpha = alpha/2;
        end
        x = x - alpha*(J(x) \ f(x));
    end
end
