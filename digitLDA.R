# MKinsey 
# Digit analysis using lda
library(MASS)

# read competition data file
# For this script I am testing on the training data set in order to evaluate the accuracy myself
train <- read.csv("train.csv")

# suffle data
size = nrow(train)
train = train[sample(size), ]

# need to remove colinear and constant columns
# TODO: better method for calculating removed columns 
# default tolerance = 0.0001, variance should be > tol^2
train = train[,apply(train, 2, function(col) { length(unique(col)) > 3 })]

# form testing and training sets
propTrain = 0.75  # proportion of dataset used to train
trainSet = train[1:(size*propTrain), ]
testSet = train[(size*propTrain):size, ]

# run lda on training set
fit = lda(trainSet[-1], trainSet[,1])

# test accuracy of the classifier
predictions = predict(fit, testSet[,-1])$class

# get missed predictions
missed = which(predictions != testSet[,1])

# find % accuracy
testSize = size * (1-propTrain)
accuracy = (testSize-length(missed))/testSize
cat("The Digit classifier had ",100*accuracy,"% accuracy.\n")

# format output
# finalprediction<- cbind(as.data.frame(1:nrow(predictions)),predictions)
# colnames(finalprediction) <- c("ImageId","Label")
# write to file
# write.csv(finalprediction,file="predictions.csv",row.names=FALSE)

