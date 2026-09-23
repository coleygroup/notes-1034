function test_barrier()
    mu = 1; tol = 1e-10; x0 = [1; 0];
    t = (1+sqrt(1+4*mu))/4; xstar = [2-t; 1-t];
    fprintf('exact barrier minimizer (mu=1): [%.6f %.6f]\n\n', xstar(1), xstar(2));
    % buggy version, as shipped in the exercise
    x = x0;
    for k = 1:100
        h = 2-x(1)-x(2);
        if h <= 0
            fprintf('  buggy : left the feasible region at iter %d (h=%.5f)  PASS\n', k-1, h); break
        end
        g = [2*(x(1)-2); 2*(x(2)-1)] + (mu/h)*[1;1];
        if norm(g) <= tol, fprintf('  buggy : converged (UNEXPECTED)\n'); break, end
        x = x - [2 0;0 2]\g;
    end
    xf = barrier_newton(x0, mu, tol);
    okx = norm(xf-xstar) < 1e-8;
    fprintf('  fixed : x=[%.6f %.6f]  %s\n', xf(1), xf(2), tf(okx));
    fprintf('  feasible (h>0): %.6f  %s\n', 2-xf(1)-xf(2), tf(2-xf(1)-xf(2)>0));
end
function s = tf(c), if c, s='PASS'; else, s='**FAIL**'; end, end
