L = 0.75;
E = 70e9;
force = 500*2.5*9.8/L * (1 - x/L);
sigma_yield = 600.0e6;
[mean_cineq, sigma_cineq] = calcMeanAndStandardDeviationOfStress ( L, E, force, x, a );
% mean_cineq = mean_cineq * sigma_yield;
% sigma_cineq = sigma_cineq * sigma_yield;
figure;
hold on
% h(1) = plot(x, mean_cineq, 'r', 'LineWidth',2);
% lgd = legend(h([1]), '\mu_{\sigma}', 'Location', 'best');
% yl = ylabel('\mu_{\sigma}','FontSize', 25);

h(1) = plot(x, sigma_cineq, 'b', 'LineWidth',2);
lgd = legend(h([1]), 'Var_{\sigma}', 'Location', 'best');
yl = ylabel('Var_{\sigma}','FontSize', 25);
hold off

legend('boxoff');
rect = [0.55, 0.55, .25, .25];
set(lgd, 'Position', rect)
set(gca,'FontSize', 20)
pos = get(gca, 'Position');
pos(1) = 0.2;
pos(2) = 0.125;
pos(3) = 0.725;
set(gca, 'Position', pos);
% ylim([0.01, 0.05])
xl = xlabel('x','FontSize', 25);

set(xl, 'Units', 'Normalized', 'Position', [0.5, -0.075, 0]);
set(yl, 'Units', 'Normalized', 'Position', [-0.15, 0.5, 0]);

