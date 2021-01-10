param1 = 10; 
param2 = 1;
obj = @(x) obj_BB2(x, param1, param2);

x0 = [0;0];
optns = optimoptions(@fmincon, ...
                     'SpecifyObjectiveGradient',true, ...
                     'SpecifyConstraintGradient',true, ...
                     'Display', 'iter', 'Algorithm', 'sqp');

[x, fval] = fmincon(obj, x0, [], [], [], [], [], [], @cnstr_BB2, optns);