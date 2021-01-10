function [ obj, dobj_da ] = objFunc( x, a )
%
% this function is wrapper of objective function
% and its gradient
%
obj = calcWeight(x, a);
if nargout > 1 
    dobj_da = calcWeightDerivative(x, a);
end
end

