function [ dfdx ] = calc_gradient( func, x )

    dim = size(x, 1);
    dfdx = zeros(dim, 1);
    x0 = x;
    eps = 1.e-12;
    for i = 1 : dim
        x0(i) = x0(i) + eps*1i;
        f0 = func(x0);
        x0(i) = x0(i) - eps*1i;
        dfdx(i) = imag(f0) / eps;
    end
end

