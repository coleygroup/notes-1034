function error = shoot(c)
% c is initial condition of ODE
    [~, x] = ode45(@(t,x) f(x,t), [t0, tf], c);
    error = g(c, x(end, :));
end
c_solution = fsolve(@shoot, c0);
[t, x] = ode45(@(t,x) f(x,t), [t0, tf], c_solution);