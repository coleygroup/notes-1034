function z = poly_precond(A, v)
% Apply z = p(A) * v for p(x) = 3 - 3x + x^2, using only
% matrix-vector products; the matrix p(A) is never formed.
Av = A * v;
AAv = A * Av;
z = 3 * v - 3 * Av + AAv;
end
