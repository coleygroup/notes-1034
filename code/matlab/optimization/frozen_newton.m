function x = frozen_newton(grad_f, hess_f, x0, tol)
% Is this Newton's method?
    x = x0;
    H = hess_f(x0);

    for k = 1:100
        g = grad_f(x);
        if norm(g) <= tol
            return
        end
        x = x - H \ g;
    end
end
