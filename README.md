# Statistical Pattern Recognition Course

Welcome to the Statistical Pattern Recognition Course repository. This repository contains a series of exercises designed to enhance your understanding of statistical pattern recognition techniques using MATLAB. Each exercise focuses on different aspects of pattern recognition, from data generation and classification to dimensionality reduction and feature selection.

## Directory Structure

### Exercises

The `Exercises` directory contains several sub-directories, each corresponding to a specific exercise or project. Below is a detailed overview of the sub-directories and their contents:

#### Exercise 1: Multivariate Normal Data Classification

- **Objective**: Implement a MATLAB program to generate and classify 2D data points from multivariate normal distributions. Calculate the decision boundary using Bayesian decision theory and visualize the results.
- **Files**:
  - `main.m`: MATLAB script to generate data, compute discriminant functions, and plot results.
  - `README.md`: Detailed description of the project and instructions.
  - `results/`: Contains generated figures and images for different parameter sets (e.g., `0.jpg`, `1.jpg`).

#### Exercise 2: Simplex Method for Gaussian Distribution

- **Objective**: Estimate the mean and variance of a Gaussian distribution using Maximum Likelihood Estimation (MLE) and the Simplex method. Visualize the parameter estimation process.
- **Files**:
  - `main.m`: MATLAB script to perform data generation, apply the Simplex method, and visualize results.
  - `README.md`: Description of the project, including results and instructions.
  - `results/`: Contains images showing initial Simplex points, algorithm movement, and the final Gaussian distribution.

#### Exercise 3: Naïve-Bayes Classifier with Parzen Window for Iris Dataset

- **Objective**: Design a Naïve-Bayes classifier for the Iris dataset using the Parzen window method with Gaussian kernels. Evaluate the classifier's performance using various metrics.
- **Files**:
  - `main.m`: MATLAB script for data preparation, Naïve-Bayes classification, and performance evaluation.
  - `README.md`: Explanation of the project and results.
  - `results/`: Includes CSV files with evaluation metrics and PNG images of confusion matrices.

#### Exercise 4: PCA Implementation

- **Objective**: Implement Principal Component Analysis (PCA) in MATLAB, applied to both synthetic data and the Iris dataset. Compare the original data with reduced-dimensionality data.
- **Files**:
  - `main.m`: MATLAB script for PCA analysis.
  - `my_pca.m`: Custom function for PCA implementation.
  - `README.md`: Details of the PCA implementation and results.
  - `results/`: Figures showing PCA results for synthetic data and the Iris dataset.

#### Exercise 5: Kernel PCA on Simulated Data

- **Objective**: Apply Kernel PCA to a simulated 3D dataset using polynomial and Gaussian kernels. Compare Kernel PCA results with standard PCA.
- **Files**:
  - `main.m`: MATLAB script for data generation and Kernel PCA application.
  - `my_kernelPCA.m`: Function implementing Kernel PCA.
  - `README.md`: Project overview and results.
  - `results/`: Includes images of Kernel PCA results with polynomial and Gaussian kernels.

#### Exercise 6: Hybrid Feature Selection Using Filter-Wrapper Method

- **Objective**: Implement a Sequential Forward Selection (SFS) algorithm using a hybrid Filter-Wrapper approach for feature selection on the Prostate Cancer dataset.
- **Files**:
  - `main.m`: MATLAB script for feature selection, model training, and evaluation.
  - `convertClasses.m`, `evaluation_measures.m`, `LDA.m`, `train_test_split.m`: Supporting functions for feature selection and model evaluation.
  - `README.md`: Description of the hybrid feature selection approach and results.
  - `results/`: Contains confusion matrices and performance metrics.

## How to Run the Projects

1. **MATLAB Setup**:
   - Ensure MATLAB is installed on your system.
   - Download or clone the repository to your local machine.

2. **Running the Scripts**:
   - Navigate to the directory of the specific exercise in MATLAB.
   - Execute the `main.m` script to run the analysis for that exercise.

3. **Dependencies**:
   - Some exercises may require specific MATLAB toolboxes. Please check the `README.md` files for each exercise for detailed dependencies and instructions.

## Conclusion

This repository provides a comprehensive set of exercises for learning and applying statistical pattern recognition techniques. By working through these exercises, you'll gain hands-on experience with key methods in pattern recognition, including data classification, dimensionality reduction, and feature selection.

For further information and detailed instructions on each exercise, refer to the individual `README.md` files within the corresponding sub-directories.