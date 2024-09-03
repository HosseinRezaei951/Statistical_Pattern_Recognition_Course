% Clear command and workspace
clc;
clear;

% Initialization  
mu1 = [3; 2];
sigma1 = [1 1.5; 1.5 4];
R1 = mvnrnd(mu1,sigma1,100);

mu2 = [5; 5];
sigma2 = [2 1; 1 4];
R2 = mvnrnd(mu2,sigma2,100);

% Discriminant functions 
Wi_1 = -0.5*(inv(sigma1));
wi_1 = (inv(sigma1))*mu1;
wi0_1 = -0.5*(mu1)'*(inv(sigma1))*(mu1)-(0.5*log(norm(sigma1,1)))+0.5;

Wi_2 = -0.5*(inv(sigma2));
wi_2 = (inv(sigma2))*mu2;
wi0_2 = -0.5*(mu2)'*(inv(sigma2))*(mu2)-(0.5*log(norm(sigma2,1)))+0.5;

g1 = @(x1, x2) [x1;x2]'*Wi_1*[x1;x2]+(wi_1'*[x1;x2])+wi0_1;
g2 = @(x1, x2) [x1;x2]'*Wi_2*[x1;x2]+(wi_2'*[x1;x2])+wi0_2;

% Generate grid
[x1, x2] = meshgrid(-10:0.2:10);

% Apply functions to grid points
g1_points = arrayfun(g1, x1, x2); 
g2_points = arrayfun(g2, x1, x2);

% Get difference points
gdiff = g1_points- g2_points; 

% Get points where contour is zero
C = contours(x1, x2, gdiff, [0,0]); 

% Get seperate coordinates of contour
x1s = C(1, 2:end);
x2s = C(2, 2:end);

% Draw plot
hold on
plot(R1(:,1),R1(:,2),'b+');
plot(R2(:,1),R2(:,2),'go');
plot(x1s,x2s,'r--');
hold off