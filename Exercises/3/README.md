# Naïve-Bayes Classifier with Parzen Window for Iris Dataset

## Project Overview

This project focuses on designing a Naïve-Bayes classifier to analyze the Iris dataset using the Parzen window method with a Gaussian kernel. The primary goal is to predict the class labels for the Iris data and evaluate the classifier's performance using various metrics such as Accuracy, Sensitivity, Specificity, and Precision.

## Problem Definition

The task involves building a Naïve-Bayes classifier that operates on the Iris dataset. The project includes the following steps:

1. **Data Division**:
   - The dataset is divided into a training set (70%) and a test set (30%).

2. **Parzen Window Method**:
   - A Parzen window method with a Gaussian kernel is employed to estimate the likelihood of the data. The width of the Gaussian kernel is tuned based on the validation error.

3. **Prediction**:
   - The model predicts the class labels for both the training and test sets.

4. **Evaluation**:
   - The performance of the classifier is assessed using Accuracy, Sensitivity, Specificity, and Precision metrics.

### Approach Used

The following outlines the approach used in the project:

1. **Data Preparation**:
   - The Iris dataset is loaded and split into training and test sets using a stratified approach to ensure that each class is adequately represented.

2. **Algorithm Implementation**:
   - A Naïve-Bayes classifier is implemented where the likelihood of each class is estimated using the Parzen window method. A Gaussian kernel is applied to smooth the data distribution.

3. **Parameter Tuning**:
   - The width of the Gaussian kernel (`h`) is varied in the range [0.01, 0.99] with increments of 0.05. The optimal value of `h` is determined based on the performance metrics.

4. **Model Evaluation**:
   - For each value of `h`, the model's performance on both the training and test sets is calculated, and the results are stored in CSV files and visualized using confusion matrices.

## How to Run the Project

1. **MATLAB Setup**:
   - Ensure MATLAB is installed and the working directory is set to the location of the project files.
   - Make sure the `iris.mat` file is present in the same directory.

2. **Run the Code**:
   - Execute the `main.m` file in MATLAB. This script loads the dataset, splits it into training and test sets, and then runs the Naïve-Bayes classifier for different values of `h`.
   - The results, including confusion matrices and evaluation metrics, will be saved in the `results` directory.

3. **Output Files**:
   - The `results` directory will contain CSV files with the evaluation metrics for each value of `h`. It will also contain PNG images of the confusion matrices.

4. **Visualization**:
   - You can visualize the performance metrics using tools like Excel by importing the CSV files. For instance, the main results are summarized in the `main_resul_table.csv` file.

## Results

The results for different values of the Gaussian kernel width `h` are saved as CSV files in the `results` directory. The confusion matrices for both training and test sets are also saved as PNG images. Below is an example of the confusion matrix visualization for `h = 0.16`:

![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercises/3/results/h=0.16.png)

### Key Findings

- The performance metrics such as Accuracy, Sensitivity, Specificity, and Precision vary with different values of `h`.
- On average, the best performance was observed for `h` values in the range of [0.16, 0.36].

## Conclusion

This project demonstrates the application of a Naïve-Bayes classifier with Parzen window estimation on the Iris dataset. The classifier's performance is highly dependent on the width of the Gaussian kernel used in the Parzen window method. The results provide insights into the optimal choice of `h` for this specific dataset.

Further exploration could involve experimenting with different kernels or alternative classification methods to enhance the model's performance.

