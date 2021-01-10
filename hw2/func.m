function [ f ] = func( x )
    if size(x, 1) ~= 3
        fprintf('size of x should be 3');
        exit;
    end
    A = [41, 12, 12; 12, 36, 32; 12, 32, 36];
    f =  besselj(0, dot(x, A*x));
end

