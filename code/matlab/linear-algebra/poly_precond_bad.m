function z = poly_precond(A, v)
% Apply z = p(A) * v for p(x) = 3 - 3x + x^2.
z = 3 * v - 3 * A * v + A * A * v;
end
