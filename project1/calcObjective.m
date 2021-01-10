%
% This function computes the objective. Since the PDE solver
% is already given in function calcFlux, this funtion is
% a wrapper of parameterization and PDE solver.
%
function [obj_val] = calcObjective(a, x, Ny, kappa, Ttop, Tbot, calcH, calcFlux)
    Np = size(x, 1);
    Nx = Np - 1;
    L = x(Np);
    % get height
    h = calcH(a, x);
    % get flux
    flux = calcFlux(L, h, Nx, Ny, kappa, Ttop, Tbot);
    % negate the flux
%     obj_val = 1./flux;
    obj_val = -flux;
end