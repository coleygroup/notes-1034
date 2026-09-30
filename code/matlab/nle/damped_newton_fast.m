function x = damped_newton_fast(f, J, x0, tol, maxit)
    x = x0;
    for k = 1:maxit
        fx = f(x);
        if norm(fx) <= tol
            return
        end
        d = -(J(x) \ fx);
        alpha = 1;
        while norm(f(x + alpha*d)) > norm(fx)
            alpha = alpha/2;
        end
        x = x + alpha*d;
    end
end
