function [ obj ] = objFunc( x )
omega  = x(1);
r2     = x(2);
alpha1 = x(3);
my_ode = @(t, y) eqn27(t, y, omega, r2, alpha1);
T1 = 0.0;
T2 = 1000.0;
% nSteps = 1000;
% t = linspace(T1, T2, nSteps+1)';
y1_0 = 0.0;
y2_0 = 0.0;
% [~, y] = ode45(my_ode, [0, 50], [y1_0; y2_0]);
% y0 = y(end, :);
% [t, y] = ode45(my_ode, [T1, T2], y0);
[t, y] = ode45(my_ode, [T1, T2], [y1_0, y2_0]);
% the average
dT = T2 - T1;
y2 = y(:, 2);
y2_avg = mean(y2);
deviation = trapz(t, (y2 - y2_avg).^2) / dT;
deviation = sqrt(deviation);
obj = -3*omega * deviation;
end

