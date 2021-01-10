
function [ cineq, ceq ] = calcStressConstraints( L, E, load, x, a )
%
% This function is a wrapper for the nonlinear constraints.
%
nx = size(x, 1);
nElems = nx - 1;
% get inner and outer radii
[r, R] = geomParameterization(x, a);
% compute 2nd moment of area
Iyy = 0.25*pi * (R.^4 - r.^4);
if min(R-r) <= 0.00
    error("the outer radius is smaller than the inner")
end
% compute displacements (vertical and angle)
u = CalcBeamDisplacement(L, E, Iyy, load, nElems);
% compute stess
cineq = CalcBeamStress(L, E, R, u, nElems);
sigma_yield = 600.0e6;
cineq = cineq / sigma_yield - 1;
ceq = [];
end
