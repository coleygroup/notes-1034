function x = precond_solve(A, b, tol)
% Solve A x = b by the preconditioned iteration
% x <- x + p(A) (b - A x), applying p(A) with poly_precond.
x = zeros(size(b));
r = b;
while norm(r) > tol * norm(b)
    x = x + poly_precond(A, r);
    r = b - A * x;
end
end
