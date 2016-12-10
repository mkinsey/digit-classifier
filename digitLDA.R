# MKinsey 
# Digit analysis using lda
library(MASS)

# get helper methods
source("lda.R")

# read competition data file
# For this script I am testing on the training data set in order to evaluate the accuracy myself
dat <- read.csv("train.csv")

size = nrow(dat)

# clean columns
train = removeConstant(dat)

# proportion of dataset used to train
propTrain = 0.90  

# run lda on training set multiple times
runs = 2
results = vector(length = runs)

for (i in c(1:runs)){

  # suffle data
  train = train[sample(size), ]
  # form testing and training sets
  trainSet = train[1:(size*propTrain), -1]
  trainLabels = train[1:(size*propTrain), 1]
  testSet = train[(size*propTrain):size, -1]
  testLabels = train[(size*propTrain):size, 1]


  accuracy = runLDA(trainSet, testSet, trainLabels, testLabels)
  results[i] = accuracy
  cat("Run ", i, ": LDA classifier had ", 100*accuracy,"% accuracy.\n")
}

# format output
# finalprediction<- cbind(as.data.frame(1:nrow(predictions)),predictions)
# colnames(finalprediction) <- c("ImageId","Label")
# write to file
# write.csv(finalprediction,file="predictions.csv",row.names=FALSE)

