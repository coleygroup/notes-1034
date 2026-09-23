function test_all()
    fprintf('MATLAB %s\n\n', version);

    %% ---- newton.m -------------------------------------------------
    fprintf('== newton.m ==\n');
    cases = {
      'convex quadratic from (3,-2)', ...
         @(x) x(1)^2+x(2)^2, @(x)[2*x(1);2*x(2)], @(x)[2 0;0 2], [3;-2], 'local minimum';
      'started AT saddle of x1^2-x2^2', ...
         @(x) x(1)^2-x(2)^2, @(x)[2*x(1);-2*x(2)], @(x)[2 0;0 -2], [0;0], 'first-order point';
      'nonconvex x1^4-2x1^2+x2^2 from (0.1,1)', ...
         @(x) x(1)^4-2*x(1)^2+x(2)^2, @(x)[4*x(1)^3-4*x(1);2*x(2)], ...
         @(x)[12*x(1)^2-4 0;0 2], [0.1;1], 'local minimum' };
    for i = 1:size(cases,1)
        [x, status] = newton(cases{i,2},cases{i,3},cases{i,4},cases{i,5},1e-8);
        okstat = strcmp(status, cases{i,6});
        fprintf('  %-40s x=[% .6f % .6f] status=''%s'' %s\n', ...
                cases{i,1}, x(1), x(2), status, tick(okstat));
    end

    %% ---- frozen_newton.m ---------------------------------------------------
    fprintf('\n== frozen_newton.m ==\n');
    g = @(x)[4*x(1)^3+x(2); x(1)+2*(1+x(2))];
    H = @(x)[12*x(1)^2 1; 1 2];
    xs = [0.7;-0.6];                       % true Newton to high accuracy
    for k=1:60, xs = xs - H(xs)\g(xs); end
    x0 = xs + [0.05;0.05];
    xf = frozen_newton(g, H, x0, 1e-10);
    fprintf('  x* (true Newton)   = [% .8f % .8f]\n', xs(1), xs(2));
    fprintf('  frozen_newton gave = [% .8f % .8f]  %s\n', xf(1), xf(2), ...
            tick(norm(xf-xs) < 1e-7));
    % asymptotic rate: predicted rho(I - H0^{-1} H(x*)) vs observed contraction
    H0 = H(x0); rho_pred = max(abs(eig(eye(2) - H0\H(xs))));
    x = x0; e = zeros(1,12);
    for k = 1:12, e(k) = norm(x-xs); x = x - H0\g(x); end
    rho_obs = e(12)/e(11);
    fprintf('  predicted rate rho = %.6f   observed e12/e11 = %.6f  %s\n', ...
            rho_pred, rho_obs, tick(abs(rho_pred-rho_obs) < 1e-3));

    test_barrier();
end

function s = tick(c)
    if c, s = 'PASS'; else, s = '**FAIL**'; end
end
