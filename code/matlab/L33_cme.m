c      = 1;
states = [5 0; 3 1; 1 2];
a      = c*states(:,1).*(states(:,1)-1);

A = [-a(1)    0    0;
      a(1) -a(2)   0;
       0    a(2)   0];

P0    = [1; 0; 0];
tspan = linspace(0,1,401);
[~,Pode] = ode15s(@(t,P) A*P, tspan, P0);  P = Pode.';

meanI = states(:,1).'*P;
meanD = states(:,2).'*P;

figure
subplot(1,2,1)
plot(tspan,P(1,:),tspan,P(2,:),tspan,P(3,:),'LineWidth',1.5)
xlabel('t'); ylabel('P(x,t)')
legend('(5,0)','(3,1)','(1,2)','Location','east'); title('CME solution')
subplot(1,2,2)
plot(tspan,meanI,'LineWidth',1.5); hold on
plot(tspan, 1 + 4*exp(-20*tspan) + (20/7)*(exp(-6*tspan)-exp(-20*tspan)),'--')
xlabel('t'); ylabel('\langle x_I \rangle')
legend('numerical','analytic'); title('Average number of I')