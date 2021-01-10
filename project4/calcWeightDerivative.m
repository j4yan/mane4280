function [ dwda ] = calcWeightDerivative( x, a )
%
% complex-variable method to compute the gradient of weight
% w.r.t the design variable.
%
nVars = size(a, 1);
dwda = zeros(nVars, 1);
eps = 1.0e-12;
for i = 1 : nVars
    a(i) = a(i) + complex(0.0, eps);
    weight = calcWeight(x, a);
    dwda(i) = imag(weight) / eps;
    a(i) = a(i) - complex(0.0, eps);
end
end

