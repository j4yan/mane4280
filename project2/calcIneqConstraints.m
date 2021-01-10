function [ cineq, ceq, dcineq_da, dceq_da ] ...
    = calcIneqConstraints( L, E, force, x, a  )
[cineq, ceq] = calcStressConstraints(L, E, force, x, a);
if nargout > 2
    [dcineq_da, dceq_da] = calcIneqDerivative(L, E, force, x, a);
end
end

