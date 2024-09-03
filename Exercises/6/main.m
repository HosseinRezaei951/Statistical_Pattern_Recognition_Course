%% Clear command and workspace
clc;
clear;
close all;
rng('default');  % For reproducibility

%% Loading assets and data pre-processing
addpath('asstes')
data = readtable('data.xlsx');
data = table2array(data)';

%% Pre-processing
X = str2double(data(2:end,1:end-1));
Y = data(2:end,end);
Y = convertClasses(Y);

%% Train-Test split
[train_x, train_y, test_x, test_y] = train_test_split(X, Y, 0.7);

%% SFS-Filter on train-set
opts = statset('Display','iter');
fun = @(XT,yT)LDA(XT,yT);
[fs,history] = sequentialfs(fun,train_x,train_y,'cv','none','options',opts);

%% Applying SFS-Filter train-set
train_x_Filtered = train_x(:,fs');

%% SFS-Wrapper on filtered train-set
y = convertClasses(train_y);
c = cvpartition(y,'k',10);
fun = @(XT,yT,Xt,yt)loss(fitcecoc(XT,yT),Xt,yt);
[fs2,history2] = sequentialfs(fun,train_x_Filtered,train_y,'cv',c,'options',opts);

%% SFS-Wrapper on test-set (Applying result of Hybrid Filter-Wrapper SFS on test-set)
test_x_SFS = test_x(:,fs2');

%% Creating classification model on selected features and predict new labels
classOrder = unique(test_y);
t = templateSVM('Standardize',true);
PMdl = fitcecoc(test_x_SFS,test_y,'Holdout',0.30,'Learners',t,'ClassNames',classOrder);
Mdl = PMdl.Trained{1};           % Extract trained, compact classifier

testInds = test(PMdl.Partition);  % Extract the test indices
XTest = test_x_SFS(testInds,:);
YTest = test_y(testInds,:);
Predicted_labels = predict(Mdl,XTest);
YTest = convertClasses(YTest);
Predicted_labels = convertClasses(Predicted_labels);

%% Showing results
figure;
Cmat = confusionchart(YTest, Predicted_labels);
Cmat.RowSummary = 'row-normalized';
Cmat.ColumnSummary = 'column-normalized';
Cmat_values = Cmat.NormalizedValues;
[accuracy, sensitivity, specificity, precision, F1Score] = evaluation_measures(Cmat_values);

X_CAT = categorical({'accuracy', 'sensitivity', 'specificity', 'precision', 'F1Score'});
X_bar = reordercats(X_CAT,{'accuracy', 'sensitivity', 'specificity', 'precision', 'F1Score'});
Y_bar = [accuracy, sensitivity, specificity, precision, F1Score];
figure;
bar(X_bar, Y_bar);