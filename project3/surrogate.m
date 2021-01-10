function [ f ] = surrogate(hyp, x, f, z)
covfunc = {@covMaterniso, 1};
likfunc = @likGauss;
[m, ~] = gp(hyp, @infExact, [], covfunc, likfunc, x, f, z);
f = m(1);
end

