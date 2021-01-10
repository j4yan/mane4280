function [a, x] = doOptimization(nElems, nVars)
L = 7.5;
E = 70e9;
% a linear initial design variable
a0 = zeros(nVars, 1);
a0(1) = 0.04635;
a0(2) = 0.0;
a0(nVars/2+1) = 0.05;
a0(nVars/2+2) = 0.0;
% grid
x = zeros(nElems+1, 1);
for i = 1 : nElems + 1
    x(i) = (i-1) * L / nElems;
end
% linearly distributed force
force = 500*2.5*9.8/L * (1 - x/L);
% get geometric constraints 
[Aineq, bineq] = getGeomConstraints(x, a0);
% objective function
% objFunc = @(a) calcWeight(x, a);
obj_func = @(a) objFunc(x,a);
% nonlinear constraint function
% nonlcon = @(a) calcStressConstraints( L, E, force, x, a );
nonlcon = @(a) calcIneqConstraints(L, E, force, x, a);
% parameters of optimizer
options = optimoptions('fmincon',...
                       'SpecifyObjectiveGradient',true, ...
                       'SpecifyConstraintGradient',true, ...
                       'Display','iter', ...
                       'MaxIter', 150);
problem.options = options;
problem.solver = 'fmincon';
problem.objective = obj_func;
problem.Aineq = Aineq;
problem.bineq = bineq;
problem.nonlcon = nonlcon;
problem.x0 = a0;

a = fmincon(problem);
end

