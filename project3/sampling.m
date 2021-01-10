function [ var, f ] = sampling( sample_size, lb, ub, func )
if size(lb, 2) ~= size(ub, 2)
    error('size(lb, 1) ~= size(ub, 1)');
end
nvar = size(lb, 2);
if nvar == 0
    error('number of variable is zero!')
end
% sampling using Latin hypercube
x = lhsdesign(sample_size, nvar);
% convert from [0, 1] to [lb, ub]
var = zeros(sample_size, nvar);
for i = 1 : nvar
    h = ub(i) - lb(i);
    var(:, i) = lb(i) + x(:,i) * h; 
end
% compute function value
f = zeros(sample_size, 1);
for i = 1 : sample_size
    f(i) = func(x(i, :));
end
end

