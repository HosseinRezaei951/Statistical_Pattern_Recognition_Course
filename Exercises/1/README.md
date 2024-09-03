# Multivariate Normal Data Classification

## Project Overview

This project implements a MATLAB program to generate and classify two sets of 2D data points drawn from multivariate normal distributions. The goal is to create and plot the data points, calculate the decision boundary using Bayesian decision theory, and visualize the results. This project is part of the "Statistical Pattern Recognition Course" and is designed to demonstrate the application of discriminant functions for classifying data points from two classes.

## Problem Definition

The task involves the following steps:
1. **Data Generation**:
   - Generate two classes of 2D data points (100 points each) using a given mean vector and covariance matrix for each class.
  
2. **Discriminant Function Calculation**:
   - Use the Bayesian decision theory to calculate the discriminant functions for the two classes.
  
3. **Decision Boundary Plotting**:
   - Plot the data points and the decision boundary that separates the two classes.

### Approach

1. **Data Generation**:
   - Two sets of data points are generated using the `mvnrnd` function, which samples from a multivariate normal distribution based on specified mean vectors (`mu1`, `mu2`) and covariance matrices (`sigma1`, `sigma2`).

2. **Discriminant Functions**:
   - Discriminant functions are derived using the given covariance matrices and mean vectors. The `fimplicit` function is used to compute the decision boundary, where the difference between the two discriminant functions equals zero.

3. **Visualization**:
   - The data points are plotted using different markers and colors to represent the two classes, and the decision boundary is superimposed on the plot.

### Results

#### Example 1
For the following parameters:
- `mu1 = [3; 2]`, `sigma1 = [1 1.5; 1.5 4]`
- `mu2 = [5; 5]`, `sigma2 = [2 1; 1 4]`

The resulting plot is:

![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercises/1/results/0.jpg)

The blue crosses represent the first class, the green circles represent the second class, and the red dashed line represents the decision boundary.

#### Example 2
For the following parameters:
- `mu1 = [0; 0]`, `sigma1 = [4 1.5; 1.5 1]`
- `mu2 = [5; 5]`, `sigma2 = [2 1; 1 4]`

The resulting plot is:

![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercises/1/results/1.jpg)

This plot shows how changes in the covariance matrix affect the orientation and spread of the data points.

## How to Run the Project

1. **Run the MATLAB Script**:
   - Execute `main.m` to generate the data, compute the discriminant functions, and plot the data along with the decision boundary.

2. **Experiment with Different Parameters**:
   - Modify the mean vectors (`mu1`, `mu2`) and covariance matrices (`sigma1`, `sigma2`) in the script to observe how the decision boundary and data distribution change.

## Directory Structure

The project includes the following sub-directory and files:

- **results/**: Contains the generated figures and images.
  - `0.fig`, `0.jpg`: MATLAB figure and JPEG image for the first set of parameters.
  - `1.fig`, `1.jpg`: MATLAB figure and JPEG image for the second set of parameters.
  - `2.fig`, `2.jpg`: Additional results with different parameters.
  - `3.fig`, `3.jpg`: Additional results with different parameters.
- `main.m`: The MATLAB script that generates the data, computes the decision boundary, and plots the results.

## Conclusion

This project illustrates the application of Bayesian decision theory in classifying multivariate normal data. By manipulating the mean vectors and covariance matrices, one can observe the impact on the decision boundary and the classification of data points. The visualizations provide a clear understanding of the underlying statistical pattern recognition concepts.
