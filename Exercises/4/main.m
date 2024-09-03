% Clear command and workspace
clc;
clear;
close all;
rng('default');  % For reproducibility

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% simle test sample
X1 = [1 2 3 4; 2 4 6 8; 3 6 9 12];
X1_PCA = my_pca(X1, 1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mu = [0 0];
Sigma = [1 1.5; 1.5 3];
X2 = mvnrnd(mu,Sigma,100)';


X2_PCA = my_pca(X2,2)';

x_range = [-10:0.1:10; -10:0.1:10]';
Y2 = mvnpdf(x_range, mu,Sigma);

mu_pca = mean(X2_PCA);
Sigma_pca = sqrt(std(X2_PCA));
Y2_pca = mvnpdf(x_range, mu_pca,Sigma_pca);

figure(1);
subplot(1,2,1);
hold on
scatter(X2(1,:),X2(2,:),'r');
scatter(X2_PCA(:,1),X2_PCA(:,2),'g');
legend({'Real Data','PCA Data'})
hold off;

subplot(1,2,2);
hold on
plot(x_range, Y2);
plot(x_range, Y2_pca);
legend({'Real Data','PCA Data'})
ylim([-0.05,max(Y2_pca)+0.05]);
hold off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Loading iris data
load iris.mat X class

X = X';
X_PCA = my_pca(X,3);

figure(2);
gscatter(X_PCA(1,:),X_PCA(2,:),class);

title('PCA on Iris(Y)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function result = my_pca(X, num_components)
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
