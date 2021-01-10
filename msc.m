f = @(x) (x-3) * x.^3 * (x-6).^4;
n = 100;

nx = 100;
x = zeros(nx, 1);
for i = 1 : nx
    x(i) = 7/(nx - 1) * i;
end
favg = zeros(nx, 1);
for j = 1 : nx
    xi = zeros(n, 1);
    for i = 1 : n
        xi = rand();
        xx = norminv(xi, x(j));
    end
end

plot(x, favg);

