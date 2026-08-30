N     = 1000;

p = @(x) 1 ./ (1 + x*x');

x = [0 0];
X = zeros(N,2);

for k = 1:N
    xp = x + randn(1,2);
    if rand < p(xp)/p(x)
        x = xp;
    end
    X(k,:) = x;
end

figure
histogram2(X(:,1),X(:,2),[20 20],'Normalization','pdf','DisplayStyle','tile')
xlabel('x_1'); ylabel('x_2'); colorbar; axis equal
title('1000 samples: 2-D histogram')
