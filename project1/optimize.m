% speficy some parameters of physics
L = 0.05;
kappa = 20.0;
Ttop = 293.15;
Tbot = 363.15;

% dimension of problem
Nx = 20;
Ny = 10;
Nvar = 5;

% grid spacing in x direction
x = zeros(Nx + 1, 1);
for i = 1 : Nx + 1
    x(i) = (i-1) * L / Nx;
end

% get constraint coefficients
[Aineq, bineq] = getConstraints(Nvar, x);

% initial value for design variables
% a0 = ones(Nvar, 1);
a0 = zeros(Nvar, 1);
a0(1) = 0.05;
a0(2) = 0.00;
a0(3) = 0.00;

% the final wrapper of objective function which only takes design variable
% \p a
objFunc = @(a) calcObjective(a, x, Ny, kappa, Ttop, Tbot, @calcHeight, @CalcFlux);

% parameters of optimizer
optns = optimoptions(@fmincon, 'Display', 'iter', 'Algorithm', 'sqp');

% call the optimizer
[a, fval] = fmincon(objFunc, a0, Aineq, bineq, [], [], [], [], [], optns);

% manually check constraints
h = calcHeight(a, x);
tol = 1.e-12;
if hmin < 0.01-tol || hmax > 0.05+tol
    fprintf('Error: height constraints violated, hmin = %16.12f, hmax = %16.12f.\n', hmin, hmax);
end

% plot the shape
plot(x,h, 'LineWidth',2)
% title('Shape of air-side face of the heat exchanger')
set(gca,'FontSize',20)
xlabel('x','FontSize',30)
ylabel('height','FontSize',30)
