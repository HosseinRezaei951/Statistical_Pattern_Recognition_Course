# Simplex Method for Gaussian Distribution

## Project Overview

This project focuses on estimating the mean and covariance matrix of a univariate Gaussian distribution using the Maximum Likelihood Estimation (MLE) and the Simplex method. The simulation involves generating 100 data points, applying the Simplex algorithm to estimate the parameters, and visualizing the search process. The code is implemented in MATLAB.

## Problem Definition

The goal of this project is to estimate the mean and variance of a Gaussian distribution from a set of generated data points using MLE and the Simplex optimization method. The process involves:

1. **Data Generation**:
   - Generate 100 data points from a Gaussian distribution using `mvnrnd` with specified mean and variance.

2. **Initial Guess**:
   - Start with three random guesses for the parameters (mean and variance).

3. **Simplex Algorithm**:
   - Apply the Simplex method to optimize the estimates of mean and variance based on the likelihood function.

4. **Visualization**:
   - Visualize the search process and compare the estimated parameters with the actual values.

## Approach Used

1. **Data Generation**:
   - 100 data points are generated from a Gaussian distribution with known mean and variance.

2. **Simplex Algorithm**:
   - Initialize three random points in the parameter space (mean and variance).
   - Apply the Simplex method to iteratively refine these points to maximize the likelihood function.
   - Use visualization to track the movement of the Simplex algorithm.

3. **Visualization**:
   - Plot the initial Simplex points, the trajectory of the Simplex algorithm, and the final Gaussian distribution with the estimated parameters.

### Results

1. **Initial Simplex Points**:

   ![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercises/2/results/1.jpg)

2. **Simplex Algorithm Movement**:

   ![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercises/2/results/2.jpg)

3. **Final Gaussian Distribution**:

   ![alt text](https://github.com/HosseinRezaei951/Statistical_Pattern_Recognition_Course/blob/main/Exercises/2/results/3.jpg)

## How to Run the Project

1. **MATLAB Setup**:
   - Ensure MATLAB is installed on your system.

2. **Script Execution**:
   - Download the `main.m` file and the `results` directory from this repository.
   - Open MATLAB and navigate to the directory containing the `main.m` file.
   - Run the `main.m` script in MATLAB to generate the results and visualizations.

3. **Dependencies**:
   - MATLAB's Statistics and Machine Learning Toolbox is required for functions such as `mvnrnd` and `normpdf`.

4. **Results**:
   - The script will generate several figures showing the initial Simplex points, the trajectory of the Simplex algorithm, and the final Gaussian distribution.

## Conclusion

This project demonstrates the application of the Simplex optimization method for parameter estimation in a Gaussian distribution. The final estimates of the mean and variance were close to the actual values, showcasing the effectiveness of the Simplex method in statistical pattern recognition.