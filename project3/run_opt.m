function [a, fmin] = run_opt(x, f)

% initial value, lower and upper bounds
x0 = [13/60*pi; 0.8; 0.058];
lb = [pi/10, 0.1, 0];
ub = [4*pi/15, 1.5, 0.3];

% gaussian processing
fprintf('Gaussian processing...\n');
hyp = gaussianProcessing(x, f);
obj_gp = @(z) surrogate(hyp, x, f, z);
obj_gp(x0)

% optimization options
fprintf('Optimizing with surrogate function...\n')
options = optimoptions('fmincon', 'Display','iter', 'MaxIter', 150);
problem.options = options;
problem.solver = 'fmincon';
problem.objective = obj_gp;
problem.Aineq = [];
problem.bineq = [];
problem.lb = lb;
problem.ub = ub;
problem.x0 = x0;

% run fmincon
[a, fmin] = fmincon(problem);
end
