function [cineq, ceq] = calcMeanStressConstraints ( L, E, force, x, a )
[mean_cineq, sigma_cineq] = calcMeanAndStandardDeviationOfStress(L, E, force, x, a);
cineq = mean_cineq + 6.0*sqrt(sigma_cineq);
sigma_yield = 600.0e6;
cineq = cineq / sigma_yield - 1;
ceq = [];
end