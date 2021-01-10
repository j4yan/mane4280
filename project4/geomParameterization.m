
function [ r, R ] = geomParameterization( x, a )
%
% This function implements the geometric parameterization.
% Currently, a polynomial is used as basis, that is,
%   r = \sum a_i     x^(i-1)
%   R = \sum a_{i+n} x^{i-1}
%
nhalf = size(a, 1) / 2;
nx = size(x, 1);
r = zeros(nx, 1);
R = zeros(nx, 1);

for i = 1 : nx
    for p = 1 : nhalf
        r(i) = r(i) + a(p)         * x(i)^(p-1);
        R(i) = R(i) + a(nhalf + p) * x(i)^(p-1);
    end
end

end

