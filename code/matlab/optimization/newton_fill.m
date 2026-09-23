function [x, status] = newton(f, grad_f, hess_f, x0, tol)
% Modified Newton method for min f(x).
    x      = x0;
    delta0 = 1e-3;
    n      = numel(x);

    for k = 1:100
        g = grad_f(x);
        H = hess_f(x);

        delta = 0;
        while true
            [L, p] = chol(H + delta*eye(n), 'lower');
            if ???
                break
            end
            delta = max(2*delta, delta0);
        end

        if norm(g) <= tol
            if ???
                status = 'local minimum';
            else
                status = 'first-order point';
            end
            return
        end

        d     = L' \ (L \ (-g));
        alpha = backtracking(f, x, g, d);
        x     = x + alpha*d;
    end

    status = 'iteration limit reached';
end

function alpha = backtracking(f, x, g, d)
    alpha = 1;
    c     = 1e-4;
    fx    = f(x);
    while f(x + alpha*d) > fx + c*alpha*(g'*d)
        alpha = alpha/2;
        if alpha < 1e-12
            break
        end
    end
end
