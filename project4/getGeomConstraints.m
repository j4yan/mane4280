function [ Aineq, bineq ] = getGeomConstraints( x, a )
%
% This function returns the geometric(linear) inequality constrains:
%
%   -r     <= -0.01
%        R <=  0.05
%    r - R <= -0.0025
%
% the structure of which looks like this
%
%   | -A  0 |        | -0.01   |
%   |  0  A | |a| <= |  0.05   |
%   |  A -A |        | -0.0025 |
%
% where A is a Vandermonde matrix since we use
% polynomial to parameterize the shape.
%
nVars = size(a, 1);
nhalf = nVars/2;
nx    = size(x, 1);
Aineq = zeros(3*nx, nVars);
bineq = zeros(3*nx, 1);  
subA  = zeros(nx, nhalf);

for i = 1 : nx
    subA(i,1) = 1.0;
    for j = 2 : nhalf
        subA(i, j) = subA(i, j-1) * x(i);
    end
end

Aineq(     1 :   nx,       1 : nhalf) = -subA;
Aineq(  nx+1 : 2*nx, nhalf+1 : nVars) =  subA;
Aineq(2*nx+1 : 3*nx,       1 : nhalf) =  subA;
Aineq(2*nx+1 : 3*nx, nhalf+1 : nVars) = -subA;

bineq(     1 :   nx) = -0.01;
bineq(  nx+1 : 2*nx) =  0.05;
bineq(2*nx+1 : 3*nx) = -0.0025;
% 
% We magnify the linear constraints so that the magnitude is
% not way smaller than the nonlinear constraints. Without this
% magnification, the optimimizer may focus on the nonlinear 
% constraint first/more, and it's easy to get R < r, which 
% would fail the finite element solver.
%
Aineq = Aineq * 1e2;
bineq = bineq * 1e2;
end

