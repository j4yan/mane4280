nx = 5;
ny = 5;
xmin = -2;
xmax = 2;
dx = (xmax - xmin) / (nx - 1);
ymin = -2;
ymax = 2;
dy = (ymax - ymin) / (ny - 1);
lb = [-2, -2];
ub = [2, 2];
xy0 = zeros(2,1);

objFunc2 = @(xy) obj_BB3(reshape(xy, 2, 1));
% parameters of optimizer
optns = optimoptions(@fmincon, 'Display', 'iter', 'Algorithm', 'sqp');
xy_bottom_left = [100,100];
xy_top_right = [-100, -100];
fmin_max = -1.0e-10;
fmin_min = 1.0e10;
for i = 1 : nx
    xy0(1) = xmin + dx * (i - 1);
    for j = 1 : ny
        xy0(2) = ymin + dy * (j - 1);
        [xy, fval, exitflag] = fmincon(objFunc2, xy0, [], [], [], [], lb, ub, [], optns);
        
        if exitflag == 0
            continue
        end
        if xy(1) < xy_bottom_left(1) && xy(2) < xy_bottom_left(2)
            xy_bottom_left(:) = xy(:);
        end
        if xy(1) > xy_top_right(1) && xy(2) > xy_top_right(2)
            xy_top_right(:) = xy(:);
        end
        if fmin_max < fval
            fmin_max = fval;
        end
        if fmin_min > fval
            fmin_min = fval;
        end
    end
end

xy_bottom_left
xy_top_right
fmin_max
fmin_min
