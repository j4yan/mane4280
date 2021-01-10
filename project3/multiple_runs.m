
% lower and upper bounds
lb = [pi/10, 0.1, 0];
ub = [4*pi/15, 1.5, 0.3];
box = ub - lb;

% initial sampling
fprintf('initial sampling...\n');
sample_size = 100;
[x, f] = sampling(sample_size, lb, ub, @objFunc);

% try multiple runs
n_runs = 20;
f_gp = zeros(n_runs, 1);
f_ex = zeros(n_runs, 1);
a = zeros(3, 1);
tol_1 = 1.e-3;
tol_2 = 1.e-3;
fold = 1.0e10;
for i = 1 : n_runs
    fprintf('opt_run = %i\n', i);
    [a, f_gp(i)] = run_opt(x, f);
    f_ex(i) = objFunc(a);
    fprintf('fe = %d, fgp = %i\n', f_ex(i), f_gp(i));
    
    if abs(f_ex(i) - fold) < tol_1 && abs(f_ex(i) - f_gp(i)) < tol_2
        break;
    end
    fold = f_gp(i);
    lb_i = a - 0.2*box;
    ub_i = a + 0.2*box;
    lb_i = min(lb_i, lb);
    ub_i = max(ub_i, ub);
    [x_i, f_i] = sampling(sample_size*0.2, lb_i, ub_i, @objFunc);  
    x = [x; x_i];
    f = [f; f_i];
%     x = [x; a'];
%     f = [f; fobj];
end
