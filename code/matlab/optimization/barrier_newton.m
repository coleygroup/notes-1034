function x = barrier_newton(x0, mu, tol)
% Newton's method for the barrier subproblem
%   phi(x,mu) = (x1-2)^2 + (x2-1)^2 - mu*log(2 - x1 - x2)
    x = x0;

    for k = 1:100
        h = 2 - x(1) - x(2);
        g = [2*(x(1)-2); 2*(x(2)-1)] + (mu/h)*[1; 1];
        H = [2 0; 0 2] + (mu/h^2)*[1 1; 1 1];

        if norm(g) <= tol
            return
        end
        x = x - H \ g;
    end
end
