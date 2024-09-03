# PCA Implementation

## Project Overview

This project focuses on implementing and analyzing Principal Component Analysis (PCA) in MATLAB, applied to both synthetic data and the Iris dataset. The goal is to demonstrate the PCA process, from calculating eigenvalues and eigenvectors to reducing the dimensionality of the data while retaining its essential features.

## Problem Definition

The assignment involves the following tasks:

1. **Eigen Analysis on Synthetic Data**:
   - Generate a two-dimensional normal distribution dataset.
   - Apply eigen analysis using MATLAB's `eig` function.
   - Visualize the eigenvectors.

2. **PCA Implementation**:
   - Implement PCA from scratch in MATLAB.
   - Apply the PCA implementation on synthetic data and the Iris dataset.
   - Visualize the results to compare the original data with the reduced dimensionality data.

## Approach Used

### PCA Implementation Steps

The PCA algorithm was implemented in a custom MATLAB function `my_pca.m`. The PCA process is broken down into six steps:

1. **Mean Centering**:
   - Subtract the mean of each dimension from the dataset to center the data around the origin.

2. **Covariance Matrix Calculation**:
   - Compute the covariance matrix from the mean-centered data.

3. **Eigen Decomposition**:
   - Use the `eig` function to obtain the eigenvalues and eigenvectors of the covariance matrix.

4. **Sorting Eigenvectors**:
   - Sort the eigenvectors by their corresponding eigenvalues in descending order.

5. **Selecting Principal Components**:
   - Select the top `num_components` eigenvectors based on the sorted eigenvalues.

6. **Transforming Data**:
   - Project the original data onto the selected eigenvectors to obtain the reduced-dimensional data.

### Application on Synthetic Data

- **Dataset Generation**:
  - A two-dimensional dataset was generated using a normal distribution with mean `[0 0]` and covariance matrix `Sigma = [1 1.5; 1.5 3]`.

- **PCA Application**:
  - The custom `my_pca` function was applied to the generated dataset to reduce its dimensionality.

- **Results Visualization**:
  - The original and PCA-transformed data were plotted, showing the preservation of the data’s structure after dimensionality reduction.

  ![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercises/4/results/1.jpg)

  ![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercises/4/results/2.jpg)

### Application on Iris Dataset

- **Dataset**:
  - The Iris dataset was used to evaluate the PCA implementation, with a focus on reducing the original 4-dimensional data to 2 dimensions.

- **PCA Application**:
  - The custom `my_pca` function was applied to the Iris dataset.

- **Results Visualization**:
  - The PCA-transformed data was visualized using a scatter plot, demonstrating that the class separation in the original data is preserved after PCA.

  ![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercise/4/results/2.jpg)

## How to Run the Project

### MATLAB Setup

1. **Clone the Repository**:
   - Clone the repository from GitHub to your local machine:
     ```
     git clone https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course.git
     ```

2. **Navigate to the Project Directory**:
   - Open MATLAB and navigate to the directory containing `main.m`.

3. **Run the Script**:
   - Execute the `main.m` script to run the PCA analysis:
     ```
     run('main.m')
     ```

### Project Files

- **main.m**: The main script that performs the PCA analysis on synthetic data and the Iris dataset.
- **my_pca.m**: The custom MATLAB function that implements PCA.
- **iris.mat**: The Iris dataset file.
- **results/**: Directory containing figures generated from the PCA analysis.

## Conclusion

This project successfully demonstrates the PCA process, from eigenvalue decomposition to data dimensionality reduction, using both synthetic and real-world datasets. The PCA implementation was verified against sample data and the Iris dataset, showing that the reduced data preserves the original structure and class separations effectively.

For more details, refer to the results and code available in this repository.
