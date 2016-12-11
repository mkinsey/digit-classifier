# MKinsey
# Digit Classification using KNN

library(class)

# read competition data file
# For this script I am testing on the training data set in order to evaluate the accuracy myself
train <- read.csv("train.csv")

# suffle data
size = nrow(train)
train = train[sample(size), ]

# form testing and training sets
propTrain = 0.9  # proportion of dataset used to train

trainSet = train[1:(size*propTrain), -1]
trainLabels = train[1:(size*propTrain), 1]

testSet = train[(size*propTrain):size, ]

# run knn on training set
fit = knn(trainSet, testSet[-1], trainLabels)

# get missed predictions
missed = which(fit != testSet[,1])

# find % accuracy
testSize = size * (1-propTrain)
accuracy = (testSize-length(missed))/testSize
cat("The KNN classifier had ",100*accuracy,"% accuracy.\n")

# KNN
# PCA using SVD
d_pca = prcomp(trainSet)

train_pca = as.matrix(trainSet) %*% d_pca$rotation[,1:150]  # columns are eigenvectors, use first 150 principal components
test_pca = as.matrix(testSet[,-1]) %*% d_pca$rotation[,1:150]
fit2 = knn(train_pca, test_pca, trainLabels)
missed2 = which(fit2 != testSet[,1])
accuracy2 = (testSize-length(missed2))/testSize
cat("The KNN + PCA classifier had ",100*accuracy2,"% accuracy.\n")
