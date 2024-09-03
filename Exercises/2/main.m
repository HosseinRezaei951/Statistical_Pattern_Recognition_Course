% Clear command and workspace
clc;
clear;
rng('default');  % For reproducibility

% Initialization  
mu = 5;
sigma = 2;
r = mvnrnd(mu,sigma,100)';
x = sort(r);
y = zeros(length(x),1);

B.name = 'B';
N.name = 'N';
W.name = 'W';
M.name = 'M';
R.name = 'R';
E.name = 'E';
Cr.name = 'Cr';
Cw.name = 'Cw';

% Generate and check Random B, N, W
while true
    B.index = random_index();
    N.index = random_index();
    W.index = random_index();
    if check_points(B, N) ~= 0 && ...
        check_points(B, W) ~= 0 && ...
        check_points(W, N) ~= 0 && ...
        check_line(B, N, W) ~= 1
        break
    end
end

B.ML = maximum_likelihood(x, B);
N.ML = maximum_likelihood(x, N);
W.ML = maximum_likelihood(x, W);

% Making first simplex triangle
[B, N, W] = sort_points([B, N, W]);
[M, R, E, Cr, Cw] = calculate_points([B, N, W], [M, R, E, Cr, Cw], x);

% Plot simplex first points
figure(1);
hold on
draw_point(B);
draw_point(N);
draw_point(W);
draw_point(M);
draw_point(R);
draw_point(E);
draw_point(Cr);
draw_point(Cw);

draw_triangle([B, N, W]);
draw_triangle([B, N, E]);
draw_triangle([B, N, R]);
draw_triangle([B, N, Cr]);
draw_triangle([B, N, Cw]);
draw_line(W, E);

title('simplex first points');
hold off;


% Start running Simplex algorithm and plot each movement
figure(2);
hold on
draw_triangle([B, N, W]);
result = [B, N, W];


while true
    if R.ML > B.ML 
       if E.ML > R.ML
           [B, N, W] = sort_points([B, N, E]);
       else
           [B, N, W] = sort_points([B, N, R]);
       end
    elseif (N.ML < R.ML) && (R.ML < B.ML)
            [B, N, W] = sort_points([B, N, R]);
    elseif R.ML < N.ML
        if (W.ML < R.ML) && (R.ML < N.ML)
            [B, N, W] = sort_points([B, N, Cr]);
        elseif  R.ML < W.ML
            [B, N, W] = sort_points([B, N, Cw]);
        end
    end
    
    [M, R, E, Cr, Cw] = calculate_points([B, N, W], [M, R, E, Cr, Cw], x);
    draw_triangle([B, N, W]);
    result = cat(2, result, [B, N, W]);
    
    if result(length(result)).ML == result(length(result)-3).ML && ...
        result(length(result)-1).ML == result(length(result)-4).ML && ...
        result(length(result)-2).ML == result(length(result)-5).ML
        break;
    end
end
title('simplex movment');
hold off;
disp(B);

% Draw final normpdf plot of x with real mu,sigma and B's mu,sigma
figure(3);
hold on

yline(0);
scatter(x,y,'o', 'MarkerFaceColor','b');
range_x = mu-10:0.1:mu+10;

pdf_x = normpdf(range_x, mu, sigma);
plot(range_x, pdf_x);

pdf_B_x = normpdf(range_x, B.index(1), B.index(2));
plot(range_x, pdf_B_x);

legend('x border', 'data points', 'normpdf(xMain)', 'normpdf(xBest)');
ylim([-0.2,0.8]);
title('normpdf');
hold off;

%%%%%%%%%%%%%%%%%%%%%%%% functions %%%%%%%%%%%%%%%%%%%%%%%%
function draw_triangle(point_list)
    draw_point(point_list(1));
    draw_line(point_list(1), point_list(2));
    draw_line(point_list(2), point_list(3));
    draw_line(point_list(3), point_list(1));
end

function draw_line(point1, point2)
    index1_list = [point1.index(1) point2.index(1)];
    index2_list = [point1.index(2) point2.index(2)];
    plot(index1_list, index2_list,'Color','black');
end

function draw_point(point)
    dx = 0.1; dy = 0.1;
    scatter(point.index(1), point.index(2),'filled');
    text(point.index(1)+dx, point.index(2)+dy, point.name, 'Fontsize', 10);
end

function [M, R, E, Cr, Cw] = calculate_points(simplex, other, x)
    B = simplex(1);
    N = simplex(2);
    W = simplex(3);
    
    M = other(1);
    R = other(2);
    E = other(3);
    Cr = other(4);
    Cw = other(5);

    M.index = middle(B, N);
    M.ML = maximum_likelihood(x, M);

    R.index = reflection(W, M);
    R.ML = maximum_likelihood(x, R);
    
    E.index = expansion(M, R);
    E.ML = maximum_likelihood(x, E);
    
    Cr.index = contraction(M, R);
    Cr.ML = maximum_likelihood(x, Cr);
    
    Cw.index = d_contraction(W, M);
    Cw.ML = maximum_likelihood(x, Cw);        
end

function result_point = d_contraction(W, M)
    index1_diff = M.index(1)-W.index(1);
    index2_diff = M.index(2)-W.index(2);
    result_point = [W.index(1)+(index1_diff/2), W.index(2)+(index2_diff/2)];        
end

function result_point = contraction(M, R)
    index1_diff = R.index(1)-M.index(1);
    index2_diff = R.index(2)-M.index(2);
    result_point = [M.index(1)+(index1_diff/2), M.index(2)+(index2_diff/2)];        
end

function result_point = expansion(M, R)
    index1_diff = R.index(1)-M.index(1);
    index2_diff = R.index(2)-M.index(2);
    result_point = [R.index(1)+index1_diff, R.index(2)+index2_diff];        
end

function result_point = reflection(W, M)
    index1_diff = M.index(1)-W.index(1);
    index2_diff = M.index(2)-W.index(2);
    result_point = [M.index(1)+index1_diff, M.index(2)+index2_diff];        
end

function result_point = middle(point1, point2)
    result_point = (point1.index(:) + point2.index(:)).'/2;
end

function result_list = swap(list, i, j)
    tmp = list(j);
    list(j) = list(i);
    list(i) = tmp;
    result_list = list;
end

function [B, N, W] = sort_points(point_list)
    for i = 1:2
        for j = i+1:3
            if point_list(i).ML < point_list(j).ML
                point_list = swap(point_list, i, j);
            end
        end
    end
    
    point_list(1).name = 'B';
    point_list(2).name = 'N';
    point_list(3).name = 'W';
    B = point_list(1);
    N = point_list(2);
    W = point_list(3);
end

function ML = maximum_likelihood(x, point)
    ML = prod(normpdf(x, point.index(1), point.index(2)));
end

function r = check_line(point1, point2, point3)
    if (point2.index(2)-point1.index(2))/(point2.index(1)-point1.index(1)) == ...
       (point3.index(2)-point1.index(2))/(point3.index(1)-point1.index(1))
        r = 1;
    else
        r = 0;
    end
end

function r = check_points(point1, point2)
    r = pdist([point1.index; point2.index]);
end

function index = random_index()
    index = [randi([0,9]), randi([0,9])];
end

