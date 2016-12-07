# MKinsey 
# Digit analysis using lda
library(MASS)

# get helper methods
source("lda.R")

# read competition data file
# For this script I am testing on the training data set in order to evaluate the accuracy myself
train <- read.csv("train.csv")

# suffle data
size = nrow(train)
train = train[sample(size), ]

# clean columns
train = removeColinear(train)


# proportion of dataset used to train
propTrain = 0.75  

# form testing and training sets
trainSet = train[1:(size*propTrain), -1]
trainLabels = train[1:(size*propTrain), 1]
testSet = train[(size*propTrain):size, ]

# run lda on training set multiple times
for (i in c(1:10)){
  accuracy = runLDA(trainSet, testSet, trainLabels)
  print("Run ", i, ": LDA classifier had ",100*accuracy,"% accuracy.\n")
}

# format output
# finalprediction<- cbind(as.data.frame(1:nrow(predictions)),predictions)
# colnames(finalprediction) <- c("ImageId","Label")
# write to file
# write.csv(finalprediction,file="predictions.csv",row.names=FALSE)

