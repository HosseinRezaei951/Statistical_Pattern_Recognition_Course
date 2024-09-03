# Hybrid Feature Selection Using Filter-Wrapper Method

## Project Overview

This project focuses on implementing a Sequential Forward Selection (SFS) algorithm using a hybrid Filter-Wrapper approach to identify the best subset of features for classification tasks. The project utilizes a Naïve Bayes or Linear Discriminant Analysis (LDA) classifier with the F1-score as the performance metric. The Fisher Discriminant function is used as the filter in the initial step, and the dataset used is the Prostate Cancer dataset, available [here](http://ico2s.org/data/instances/microarray/).

## Problem Definition

The task involves selecting the most relevant features from a high-dimensional microarray dataset to classify samples as either "tumor" or "normal". The hybrid SFS approach is employed as follows:

1. **Filter Step**:
   - LDA is used to select an initial subset of features based on their discriminative power.
   
2. **Wrapper Step**:
   - A more refined selection is performed on the filtered features using a classification model (SVM in this case) evaluated through a 10-fold cross-validation scheme.

### Approach Used

The project was implemented in MATLAB, and the following steps outline the approach:

1. **Data Preprocessing**:
   - The dataset is loaded and preprocessed to separate features from labels. Labels are converted into binary format ("normal" or "tumor").

2. **Train-Test Split**:
   - The dataset is split into 70% training and 30% testing data using the `train_test_split` function.

3. **Sequential Forward Selection (Filter)**:
   - The initial SFS is performed using LDA as the filter criterion, reducing the feature set from 2135 to 67 features.

4. **Sequential Forward Selection (Wrapper)**:
   - The Wrapper method further reduces the feature set from 67 to 4 features using an SVM classifier and a 10-fold cross-validation scheme.

5. **Model Training and Evaluation**:
   - A classification model is built on the selected features, and its performance is evaluated on the test set using various metrics like accuracy, sensitivity, specificity, precision, and F1-score.

## Results

The hybrid approach successfully reduced the feature set from 2135 features to just 4 features, with the classification model achieving promising results.

- **Confusion Matrix**: Below is the confusion matrix generated after applying the model to the test set:

![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercise/6/results/confusion_matrix.jpg)

- **Performance Metrics**: The model's performance on the test set is summarized in the bar chart below, showing accuracy, sensitivity, specificity, precision, and F1-score:

![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercise/6/results/results.jpg)

## How to Run the Project

1. **Setup**:
   - Ensure MATLAB is installed and add the necessary files in the `assets` directory to your MATLAB path.

2. **Data Preparation**:
   - Download the dataset from [this link](http://ico2s.org/data/instances/microarray/), extract it, and convert the `prostate_preprocessed.txt` file to `data.xlsx` using Excel.

3. **Running the Code**:
   - Execute the `main.m` script in MATLAB to perform feature selection, model training, and evaluation.

4. **Dependencies**:
   - The following MATLAB scripts are required:
     - `convertClasses.m`
     - `evaluation_measures.m`
     - `LDA.m`
     - `train_test_split.m`

5. **Results**:
   - The confusion matrix and performance metrics will be displayed upon completion of the script.

## Conclusion

This project demonstrates the effectiveness of using a hybrid Filter-Wrapper approach for feature selection in high-dimensional datasets. By selecting a minimal subset of features, the model maintains high accuracy while reducing computational complexity. Future work could explore different classifiers or alternative feature selection techniques to further optimize performance.
