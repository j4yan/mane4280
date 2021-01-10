function [ cineq, ceq, dcineq_da, dceq_da] ...
    = calcIneqConstraints( L, E, force, x, a, dcineq_da_old, dceq_da_old)
[cineq, ceq] = calcMeanStressConstraints(L, E, force, x, a);
if nargout > 2 
    dcineq_da = dcineq_da_old;
    dceq_da = dceq_da_old;
end
end

