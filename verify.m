clear
clc
close all

x0 = [13/60*pi; 0.8; 0.058];
lb = [pi/10, 0.1, 0];
ub = [4*pi/15, 1.5, 0.3];

n = 100;
w = linspace(lb(1), ub(1), n).';
stddev = zeros(n, 1);
for i=1:n
    xi = x0;
    xi(1) = w(i);
    stddev(i) = -objFunc(xi);
end

plot(w, stddev);