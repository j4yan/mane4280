function [ weight ] = calcWeight( x, a )
%
% Calculate the weight of spar
%
density = 1600;
nElems = size(x, 1) - 1;

% get inner and outer radii
[r, R] = geomParameterization(x, a);

% loop over all elements, accumulate the volume
weight = 0.0;
for i = 1 : nElems
    dx = x(i+1) - x(i);
    area = R(i+1)*R(i+1) - r(i+1)*r(i+1) + R(i)*R(i) - r(i)*r(i);
    weight = weight + area * dx;
end

% factor pi comes from S = pi*R^2; 
% factor 0.5 comes from average of bottom and top area of each element.
weight = weight * 0.5 * pi * density;

end
