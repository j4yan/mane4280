function [mean, squared] = calcMeanAndStandardDeviationOfStress ( L, E, force, x, a )
nx = size(x, 1);
nElems = nx - 1;
% get inner and outer radii
[r, R] = geomParameterization(x, a);
% compute 2nd moment of area
Iyy = 0.25*pi * (R.^4 - r.^4);
if min(R-r) <= 0.00
    error("the outer radius is smaller than the inner")
end
% Gauss-Hermite quadrature rule
n_qp = 3;
[xi, w] = hermquad(n_qp);
% adjusted weights
w = w / sqrt(pi);
% mean and standard deviations
mu = zeros(4, 1);
fnom = 500*2.5*9.8/L;
sigma = zeros(4, 1);
for n = 1 : 4
    sigma(n) = fnom * 0.1 / n;
end

% later we accumulate the whole loading rather just the perturbed loading,
% therefore, this mean value is initialized to zero
[unper_cineq, ~] = calcStressConstraints( L, E, force, x, a );
len_stress = size(unper_cineq, 1);
mean = zeros(len_stress, 1);
squared_val = zeros(len_stress, 1);
% loop over for random variables, accumalate mean_cineq
for i1 = 1 : size(xi,1)
    pt1 = sqrt(2) * sigma(1) * xi(i1) + mu(1);
    cos_val1 = cos((2*1 - 1) * pi * x / (2*L));     % a vector of dim of size(x,1)
    pert1 = pt1 * cos_val1;                        % a vector of dim of size(x,1)
    for i2 = 1 : size(xi, 1)
        pt2 = sqrt(2) * sigma(2) * xi(i2) + mu(2);
        cos_val2 = cos((2*2 - 1) * pi * x / (2*L));
        pert2 = pt2 * cos_val2;
        for i3 = 1 : size(xi, 1)
            pt3 = sqrt(2) * sigma(3) * xi(i3) + mu(3);
            cos_val3 = cos((2*3 - 1) * pi * x / (2*L));
            pert3 = pt3 * cos_val3;     
            for i4 = 1 : size(xi, 1)
                pt4 = sqrt(2) * sigma(4) * xi(i4) + mu(4);
                cos_val4 = cos((2*4 - 1) * pi * x / (2*L));
                pert4 = pt4 * cos_val4;
                pert_force = pert1 + pert2 + pert3 + pert4 + force;
                % compute displacements (vertical and angle)
                u = CalcBeamDisplacement(L, E, Iyy, pert_force, nElems);
                % compute stess
                stress = CalcBeamStress(L, E, R, u, nElems);
                mean = mean + w(i1) * w(i2) * w(i3) * w(i4) * stress;
                squared_val = squared_val + w(i1) * w(i2) * w(i3) * w(i4) * stress.^2;
            end
        end
    end
end
squared = sqrt(squared_val - mean.^2);
end
