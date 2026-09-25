function [x, k] = newton_residual(f, df, x0, tol, maxit)
    x = x0;
    for k = 1:maxit
        fx = f(x);
        if norm(fx) <= tol
            return
        end
        x = x - df(x) \ fx;
    end
    error('maximum iterations reached');
end
