function Q = gram_schmidt(A)
% Orthonormalize the columns of A.
[n, k] = size(A);
Q = zeros(n, k);
for j = 1:k
    v = A(:, j);
    for i = 1:j-1
        v = ??? ;
    end
    Q(:, j) = v / norm(v);
end
end
