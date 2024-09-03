% Clear command and workspace
clc;
clear;
close all;
rng('default');  % For reproducibility

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 500;
sphere1 = my_sphere(15, N);
sphere2 = my_sphere(10, N);
data = [sphere1; sphere2];

% original data
figure;
hold on
plot3(data(1:N,1), data(1:N,2), data(1:N,3), 'b*');
plot3(data(N+1:end,1), data(N+1:end,2), data(N+1:end,3), 'ro');
axis([-20 20 -20 20 -20 20]);
legend('class 1', 'class 2');
view(3);
title('original data');
hold off;

% standard PCA
figure;
hold on
PCA_r = my_PCA(data', 2)';
plot(PCA_r(1:N,1), PCA_r(1:N,2), 'b*');
plot(PCA_r(N+1:end,1), PCA_r(N+1:end,2), 'ro');
axis([-20 20 -20 20]);
legend('class 1', 'class 2');
title('standard PCA');
hold off;

% polynomial kernel PCA
FigH1 = figure('units','normalized','outerposition',[0 0 1 1]);
for d = 1:9
    subplot(3,3,d);
    polyPCA_r = my_kernelPCA(data, 2, "polynomial", d)';
    hold on
    plot(polyPCA_r(1:N,1), polyPCA_r(1:N,2), 'b*');
    plot(polyPCA_r(N+1:end,1), polyPCA_r(N+1:end,2), 'ro');
    hold off;
    legend('class 1', 'class 2');
    title("polynomial kernel PCA (d="+num2str(d)+")");
end
fig_name1 = "results/polynomial_kernel_PCA";
saveas(FigH1, fig_name1,'png');

% Gaussian kernel PCA
FigH2 = figure('units','normalized','outerposition',[0 0 1 1]);
for d = 1:9
    subplot(3,3,d);
    gaussPCA_r = my_kernelPCA(data, 2, "gaussian", d)';
    hold on
    plot(gaussPCA_r(1:N,1), gaussPCA_r(1:N,2), 'b*');
    plot(gaussPCA_r(N+1:end,1), gaussPCA_r(N+1:end,2), 'ro');
    hold off;
    legend('class 1', 'class 2');
    title("gaussian kernel PCA (sigma="+num2str(d)+")");
end
fig_name2 = "results/gaussian_kernel_PCA";
saveas(FigH2, fig_name2,'png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = my_kernelPCA(X, num_components, type, d)
    n = size(X,1);

    % Step-1
    if (type == "polynomial")
        K = X*X'+1;
        K = K.^d;
    elseif (type == "gaussian")
        K = squareform(pdist(X)).^2;
        K = exp(-K./(2*(d.^2)));
    end

    % Step-2
    J = ones(n,n)/n;
    KBar = K - J*K - K*K + J*K*J;

    % Step-3
    [eigen_vectors, eigen_values] = eig(KBar); 
    
    % Step-4
    [~,sorted_index] = sort(diag(eigen_values),'descend');
    sorted_eigenvectors = eigen_vectors(:,sorted_index);

    % Step-5
    eigenvector_subset = sorted_eigenvectors(:,1:num_components);
    
    % Step-6
    result = eigenvector_subset'*K;
end


function result = my_PCA(X, num_components)
    % Step-1
    X_meanCentered = X - mean(X,2);

    % Step-2
    cov_mat = cov(X_meanCentered');
    
    % Step-3
    [eigen_vectors, eigen_values] = eig(cov_mat); 
    
    % Step-4
    [~,sorted_index] = sort(diag(eigen_values),'descend');
    sorted_eigenvectors = eigen_vectors(:,sorted_index);

    % Step-5
    eigenvector_subset = sorted_eigenvectors(:,1:num_components);
    
    % Step-6
    result = eigenvector_subset'*X;
end

function result = my_sphere(radius, nPoints) 
    X = randn(nPoints,3);
    X = X./sqrt(sum(X.^2,2));
    result = X.*radius;
end
