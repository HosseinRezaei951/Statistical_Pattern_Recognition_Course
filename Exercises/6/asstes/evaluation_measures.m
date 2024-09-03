function [accuracy, sensitivity, specificity, precision, F1Score] = evaluation_measures(confusion_matrix)
    TP = confusion_matrix(1,1);
    FP = confusion_matrix(2,1);
    FN = confusion_matrix(1,2);
    TN = confusion_matrix(2,2);
    

    accuracy = (TP+TN)/(TP+TN+FN+FP) ;
    sensitivity = TP/(TP+FN);
    specificity = TN/(TN+FP);
    precision = TP/(TP+FP);
    F1Score = (2*(precision*sensitivity))/(precision+sensitivity);
end