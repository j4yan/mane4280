%
% This function computes the height. It is the parameterization 
% of shape of the heat exchanger. The basis is sine functions.
%
function [ h ] = calcHeight(a, x)
Nvar = size(a, 1);
Np = size(x, 1);
L = x(Np);

h = zeros(Np, 1);
for i = 1 : Np
    h(i) = a(1);
    for j = 2 : Nvar
        tmp = 2.0 * pi * (j-1) * x(i) / L;
        h(i) = h(i) + a(j) * sin(tmp);
    end
end
end

