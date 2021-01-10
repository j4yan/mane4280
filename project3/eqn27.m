function dydt = eqn27( tau, y, omega, r2, alpha1 )
% Reference: 
% Chaos at the amusement park: Dynamics of the Tilt?A?Whirl
% by R. L. Kautz.

%  Given parameters
Q0 = 20;
alpha0 = 0.036;
r1 = 4.3;
g = 9.8;
% derived parameters
gamma = 1 / (3*omega) * sqrt(g/r2);
eps = r1 / (9*r2);
alpha = alpha0 - alpha1 * cos(tau);
beta = 3 * alpha1 * sin(tau);
% rhs of ode
c1 = -gamma / Q0;
c2 = -(eps - gamma*gamma * alpha);
c3 = - gamma*gamma * beta;
dydt = [y(2); c1*y(2) + c2*sin(y(1)) + c3*cos(y(1))];
