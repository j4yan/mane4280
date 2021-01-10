function [ dcineq_da, dceq_da ] = calcIneqDerivative( L, E, force, x, a )
%
% complex-variable method to compute the derivative of inequality
% function w.r.t. design variable a
%
[cineq, ceq] = calcMeanStressConstraints(L, E, force, x, a);
nVars = size(a, 1);
nineq = size(cineq, 1);
neq   = size(ceq, 1);
dcineq_da = zeros(nVars, nineq);
dceq_da   = zeros(nVars, neq);
eps = 1.0e-12;

for i = 1 : nVars
    a(i) = a(i) + complex(0.0, eps);
    [cineq, ceq] = calcMeanStressConstraints(L, E, force, x, a);
    a(i) = a(i) - complex(0.0, eps);
    for j = 1 : nineq
        dcineq_da(i, j) = imag(cineq(j)) / eps;
    end
    for j = 1 : neq
        dceq_da(i, j) = imag(ceq(j)) / eps;
    end
end

end

