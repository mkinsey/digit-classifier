# Exploration in classification using MNIST data

## Objective

The aim of this project is to predict handwritten digits from the famous MNIST dataset. For this 
project, the data representing one image comes in the form of 784 values, 
making a 28 by 28 pixel image. Each of the values can range between 0 and 255. 

By building a matrix and using R's `image` function, we can visualize the provided data. Here is a random row from the dataset:

![A handwritten three](img/mnist3.png)

This project was inspired by the Digit Regognizer [Kaggle Competition](https://www.kaggle.com/c/digit-recognizer/data).

## LDA

Linear Discriminant Analysis projects the vectors into a subspace that maximizes the between class variance. This projection can then be used as a naive classifier. Let us examine the effectiveness of this approach.

LDA cannot be used when within-class covariance matricies are singular, so the first step is to remove all low variability factors. In the context of our problem, these would be pixels are similiar in every image, such as the corners. I used the number of unique values in each column (factor) to remove low variability columns. This reduced the number of factors by about 100 - 120. 

In order to evaluate the accuracy of the classification, I am randomly dividing the labeled data set (42,000 images) into a training and testing data set a 9:1 ratio.

## KNN


## Results

Classification using LDA had an accuracy of about 86%. It was efficient enough that multiple trials could be run in the span of a few minutes on a personal machine. 

 