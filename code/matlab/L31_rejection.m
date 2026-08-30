N = 1000;
X = zeros(N,2);
n = 0;

p = @(x1,x2) (1/3)*((x1<=0.5 & x2<=0.5) | (x1>0.5 & x2>0.5 )) ...
    + (1/6)*((x1<=0.5 & x2> 0.5) | (x1>0.5 & x2<=0.5));

M = 1/3;

while n < N
    xp   = rand(1,2);
    ntry = ntry + 1;
    if rand < p(xp(1),xp(2))/M
        n = n + 1;
        X(n,:) = xp;
    end
end

figure
h = histogram2(X(:,1),X(:,2),[2 2],'Normalization','probability','FaceColor','flat');
xlabel('x_1'); ylabel('x_2'); zlabel('p(x)'); colorbar
title('1000 rejection samples')

disp('BinCounts matrix (rows = x1 bins, cols = x2 bins):'); disp(h.BinCounts)