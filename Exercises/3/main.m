% Clear command and workspace
clc;
clear;
close all;
rng('default');  % For reproducibility

% Loading iris data
load iris.mat X class

% train/test split for validation
p = 0.7;
nClass = 3;
[train_data, test_data, train_class, test_class] = train_test_split(X, class, p, nClass);

% initialisation
H = (0.01:0.05:0.99)';
classes = (1:nClass)';
set(0,'DefaultFigureVisible','off');
disp_str = "";
main_results = [];

% main loop for running while algorithm on each h(=sigma) and saving results
for j = 1:length(H) 
    disp("h=" + num2str(H(j,1)));

    % predict train_set class
    predicted_train_class = zeros(length(train_class),1);
    for i = 1:length(train_class)
        predicted_train_class(i,1) = predict_class(train_data(i,:), train_data, nClass, H(j,1));
    end
    
    % predict test_set class
    predicted_test_class = zeros(length(test_data),1);
    for i = 1:length(test_data)
        predicted_test_class(i,1) = predict_class(test_data(i,:), train_data, nClass, H(j,1));
    end
    
    % calculate confusion matrix for predicted_train_class
    Cmat_train = confusionchart(train_class', predicted_train_class');
    Cmat_train_values = Cmat_train.NormalizedValues;
    
    % calculate confusion matrix for predicted_test_class
    Cmat_test = confusionchart(test_class', predicted_test_class');
    Cmat_test_values = Cmat_test.NormalizedValues;

    % calculate train_set evaluation measures
    [train_accuracy, train_sensitivity, ...
     train_specificity, train_precision] = evaluation_measures(Cmat_train_values);

    % calculate test_set evaluation measures
    [test_accuracy, test_sensitivity, ...
     test_specificity, test_precision] = evaluation_measures(Cmat_test_values);
    
    % calculate confusion matrixs and save them
    FigH = figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,2,1);
    Cmat_train = confusionchart(train_class', predicted_train_class');
    Cmat_train.RowSummary = 'row-normalized';
    Cmat_train.ColumnSummary = 'column-normalized';
    Cmat_train.Title = 'train set';
    subplot(1,2,2);
    Cmat_test = confusionchart(test_class', predicted_test_class');
    Cmat_test.RowSummary = 'row-normalized';
    Cmat_test.ColumnSummary = 'column-normalized';
    Cmat_test.Title = 'test set';
    fig_name = "results/h=" + num2str(H(j,1)) + ".png";
    saveas(FigH, fig_name,'png');

    % write each evaluation measures result in specific csv file 
    result_table = table(classes, ...
     train_accuracy, train_sensitivity, ...
     train_specificity, train_precision, ...
     test_accuracy, test_sensitivity, ...
     test_specificity, test_precision);
    file_name = "results/h=" + num2str(H(j,1));
    writetable(result_table, file_name + ".csv");

    % get mean of classes for evaluation measures 
    main_results = cat(1, main_results, ...
        [sum(train_accuracy)/nClass, sum(train_sensitivity)/nClass, ...
        sum(train_specificity)/nClass, sum(train_precision)/nClass, ...
        sum(test_accuracy)/nClass, sum(test_sensitivity)/nClass, ...
        sum(test_specificity)/nClass, sum(test_precision)/nClass] );
end

% write evaluation measures mean result in specific csv file 
train_accuracy_mean = main_results(:,1);
train_sensitivity_mean = main_results(:,2);
train_specificity_mean = main_results(:,3);
train_precision_mean = main_results(:,4);

test_accuracy_mean = main_results(:,5);
test_sensitivity_mean = main_results(:,6);
test_specificity_mean = main_results(:,7);
test_precision_mean = main_results(:,8);
main_resul_table = table(H, train_accuracy_mean, train_sensitivity_mean, ...
                          train_specificity_mean, train_precision_mean, ...
                          test_accuracy_mean, test_sensitivity_mean, ...
                          test_specificity_mean, test_precision_mean);
writetable(main_resul_table, "results/main_resul_table" + ".csv");




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [accuracy, sensitivity, specificity, precision] = evaluation_measures(confusion_matrix)
    nClass = size(confusion_matrix, 1);
    TP = zeros(nClass, 1);
    FP = zeros(nClass, 1);
    FN = zeros(nClass, 1);
    TN = zeros(nClass, 1);
    for i = 1:nClass
        TP(i) = confusion_matrix(i,i);
        FP(i) = sum(confusion_matrix(:,i)) - TP(i);
        FN(i) = sum(confusion_matrix(i,:)) - TP(i);
        TN(i) = sum(sum(confusion_matrix(:,:))) - (TP(i) + FP(i) + FN(i));
    end
    
    accuracy = zeros(nClass, 1);
    sensitivity = zeros(nClass, 1);
    specificity = zeros(nClass, 1);
    precision = zeros(nClass, 1);
    for i = 1:nClass
        accuracy(i) = (TP(i)+TN(i))/(TP(i)+FP(i)+FN(i)+TN(i));
        sensitivity(i) = TP(i)/(TP(i)+FN(i));
        specificity(i) = TN(i)/(TN(i)+FP(i));
        precision(i) = TP(i)/(TP(i)+FP(i));
    end
end


function class = predict_class(sample, train_data, nClass, h)
    class_range = size(train_data,1) / nClass;
    results = [];
    
    % estimate sample likelihood for each class 
    for i = 1:class_range:size(train_data,1)
        p = likelihood(sample, train_data(i:i+(class_range-1),:), h);
        p = prod(prod(p));
        results = cat(1, results, p);
    end

    % select the bigest likelihood
    % as maximum-likelihood that 
    % represent class for sample
    class = find(max(results)==results);
end

function LH = likelihood(sample, data, h)
    nDimention=size(data, 2);
    px_list = [];

    % estimate density for each dimension of sample
    % in front of corresponding data dimensions 
    for i = 1:nDimention
        tmp_px = density_estimation(sample(i), data(:,i), h);
        px_list = cat(1, px_list, tmp_px);
    end

    % product all densities and return it
    % as sample likelihood via data
    LH = prod(px_list);
end


function px = density_estimation(X, data, h)
    [ns,nv]=size(data);
    px=0;
    for i=1:ns
        px=px+exp(-((X-data(i,:))*(X-data(i,:))')/(2*h^2))/(sqrt(2*pi)*h^nv);
    end
    px=px/ns;
end

function [train_data, test_data, train_class, test_class] = train_test_split(data, class, p, nClass)  
    train_data = [];
    test_data = [];
    train_class = [];
    test_class = [];
    class_range = size(data,1) / nClass;
    for i = 1:class_range:size(data,1)
        tf = false(class_range,1);    % create logical index vector
        tf(1:round(p*class_range)) = true;     
        tf = tf(randperm(class_range));   % randomise order
        
        tmp_data = data(i:i+(class_range-1),:);
        train_data = cat(1, train_data, tmp_data(tf,:)); 
        test_data = cat(1, test_data, tmp_data(~tf,:)); 
        
        tmp_class = class(i:i+(class_range-1),:);
        train_class = cat(1, train_class, tmp_class(tf,:)); 
        test_class = cat(1, test_class, tmp_class(~tf,:)); 
    end
end