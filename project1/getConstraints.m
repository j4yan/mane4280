%
% This function establish the constrains, ie, we have to 
% tansform the original constraints
%   h1 <= h <= h2
% into a form of
%   A*a <= b
% which is acceptable by fmincon. Note h1 <= h is equivalent to
%   h <= -h1
%
function [ A, b ] = getConstraints(Nvar, x)
Np = size(x, 1);
L = x(Np);
A = zeros(2 * Np, Nvar);
b = zeros(2 * Np, 1);

for i = 1 : Np
    A(i,    1) =  1.0;      % dh/da1
    A(Np+i, 1) = -1.0;      
    for k = 2 : Nvar
        tmp = sin(2 * pi * (k-1) * x(i) / L);
        A(i,      k) =  tmp;    % dh/dak
        A(Np + i, k) = -tmp;   
    end
    b(i)      = 0.05;    % upper bound
    b(Np + i) = -0.01;   % lower bound
end
end


% function [ Aineq, bineq ] = get_constraints(nvar, x)
% % nvar = size(a,1); % number of design variables
% Nx = size(x,1) - 1;
% L = x(Nx+1);
% Aineq = zeros(2*(Nx+1),nvar);
% bineq = zeros(2*(Nx+1),1);
% for i = 1:(Nx+1)
%   % first, the upper bound
%   Aineq(i,1) = 1.0; % this coefficient corresponds to variable a_1
%   for k = 2:nvar
%     Aineq(i,k) = sin(2*pi*(k-1)*x(i)/L); % this coefficient corresponds to variable a_k
%   end
%   bineq(i) = 0.05; % the upper bound value
%   % next, the lower bound; we use ptr to shift the index in Aineq and bineq
%   ptr = Nx+1;
%   Aineq(ptr+i,1) = -1.0; % note the negative here!!! fmincon expects inequality in a form A*x < b
%   for k = 2:nvar
%     Aineq(ptr+i,k) = -sin(2*pi*(k-1)*x(i)/L); % again, a negative
%   end
%   bineq(ptr+i) = -0.01; % negative lower bound
% end
% 
% 
% 
% end

