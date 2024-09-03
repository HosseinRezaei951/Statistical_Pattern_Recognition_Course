# Kernel PCA on Simulated Data

## Project Overview

This project demonstrates the application of Kernel Principal Component Analysis (Kernel PCA) on a simulated dataset. The dataset was generated using the MATLAB `sphere` function to create two distinct classes of data points. The objective is to explore the effects of different kernel functions—polynomial and Gaussian—on the PCA results, and to compare them with standard PCA.

## Problem Definition

The task is to implement Kernel PCA using MATLAB, comparing the results with those of standard PCA. The project involves:

1. Generating a simulated 3D dataset with two classes using the `my_sphere` function.
2. Applying standard PCA to reduce the data from three dimensions to two.
3. Implementing Kernel PCA with both polynomial and Gaussian kernels to project the data into a 2D space.
4. Analyzing how well the Kernel PCA separates the two classes as compared to standard PCA.

## Approach

### Data Generation

- **Simulated Data**: Two sets of 3D data points were generated with different radii using the `my_sphere` function.
- **Data Visualization**: The original 3D data was plotted to visualize the distribution of the two classes.

### PCA Implementation

- **Standard PCA**: The standard PCA algorithm was applied to reduce the dimensionality of the data from 3D to 2D. The result shows that standard PCA does not clearly separate the two classes.

### Kernel PCA Implementation

The Kernel PCA algorithm was implemented in MATLAB as `my_kernelPCA`. This function accepts the following parameters:
- `X`: The dataset.
- `num_components`: Number of principal components to retain.
- `type`: Kernel type, either "polynomial" or "gaussian".
- `d`: Parameter for the kernel function (degree for polynomial, sigma for Gaussian).

**Steps of Kernel PCA**:
1. Compute the kernel matrix based on the selected kernel type.
2. Center the kernel matrix.
3. Compute the eigenvalues and eigenvectors of the centered kernel matrix.
4. Sort the eigenvectors according to the descending order of eigenvalues.
5. Select the top `num_components` eigenvectors.
6. Project the data onto the selected eigenvectors.

### Visualization and Analysis

- **Polynomial Kernel PCA**: Applied Kernel PCA with a polynomial kernel for `d` ranging from 1 to 9. The results were visualized and saved in the `results/polynomial_kernel_PCA.png` file.
  
  ![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercises/5/results/polynomial_kernel_PCA.png)

- **Gaussian Kernel PCA**: Applied Kernel PCA with a Gaussian kernel for `sigma` ranging from 1 to 9. The results were visualized and saved in the `results/gaussian_kernel_PCA.png` file.

  ![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercises/5/results/gaussian_kernel_PCA.png)

## How to Run the Project

1. **MATLAB Setup**:
   - Clone the repository and navigate to the project directory in MATLAB.
   - Ensure that all required files (`main.m`, `my_kernelPCA.m`, `my_PCA.m`, and `my_sphere.m`) are in the same directory.

2. **Running the Code**:
   - Execute the `main.m` script in MATLAB. This script will generate the dataset, apply standard PCA, and perform Kernel PCA with both polynomial and Gaussian kernels.
   - The results will be displayed as plots and saved in the `results` directory.

3. **Dependencies**:
   - The project relies on standard MATLAB functions like `pdist`, `eig`, and `squareform`.

## Results and Conclusion

The results indicate that:
- **Standard PCA** does not effectively separate the two classes in the reduced 2D space.
- **Polynomial Kernel PCA** shows varying degrees of class separation depending on the degree `d`. Higher degrees generally provide better separation.
- **Gaussian Kernel PCA** provides the best class separation for larger values of `sigma`. The separation is more distinct as `sigma` increases.

This project demonstrates the importance of selecting an appropriate kernel function and its parameters in Kernel PCA for effective dimensionality reduction and class separation.
