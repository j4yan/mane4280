figure;
hold on
pOrder = 1;
nVars = 2*(pOrder+1);

nElems = 5;
[a, x] = doOptimization(nElems, nVars);
[r, R] = geomParameterization(x, a);
h(1) = plot(x, r, 'r', 'LineWidth',2);
h(2) = plot(x, R, 'r', 'LineWidth',2);
nElems = 10;
[a, x] = doOptimization(nElems, nVars);
[r, R] = geomParameterization(x, a);
h(3) = plot(x, r, 'b', 'LineWidth',2);
h(4) = plot(x, R, 'b', 'LineWidth',2);

nElems = 20;
[a, x] = doOptimization(nElems, nVars);
[r, R] = geomParameterization(x, a);
h(5) = plot(x, r, 'g', 'LineWidth',2);
h(6) = plot(x, R, 'g', 'LineWidth',2);

hold off
lgd = legend(h([1 3 5]), 'nElems = 5', 'nElems = 10', 'nElems = 20', 'Location', 'best');
legend('boxoff');
rect = [0.55, 0.55, .25, .25];
set(lgd, 'Position', rect)
set(gca,'FontSize', 20)
pos = get(gca, 'Position');
pos(1) = 0.2;
pos(2) = 0.1;
pos(3) = 0.75;
set(gca, 'Position', pos)
xl = xlabel('x','FontSize', 25);
yl = ylabel('Radius','FontSize', 25);
% set(xl, 'Units', 'Normalized', 'Position', [-0.15, 0.15, 0]);
set(yl, 'Units', 'Normalized', 'Position', [-0.22, 0.2, 0]);
