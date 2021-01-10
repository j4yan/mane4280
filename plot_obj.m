function [  ] = plot_obj( iter, f_ex, f_gp )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
figure;
hold on
h(1) = plot(iter, -f_gp, '-+', 'LineWidth',3);
h(2) = plot(iter, -f_ex, '-o', 'LineWidth',3);
lgd = legend(h([1 2]), 'surrogate', 'direct', 'Location', 'best');
hold off
legend('boxoff');
rect = [0.65, 0.65, .25, .25];
set(lgd, 'Position', rect)
set(gca,'FontSize', 25)

pos = get(gca, 'Position');
pos(1) = 0.15;
pos(2) = 0.15;
pos(3) = 0.75;
set(gca, 'Position', pos);
xl = xlabel('iter', 'FontSize', 30);
yl = ylabel('objective', 'FontSize', 30);
set(yl, 'Units', 'Normalized', 'Position', [-0.015, 1.25, 0]);


end

