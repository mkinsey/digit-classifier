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
trainC = removeConstant(train, n = 4)
trainD = removeColinear(train, tolerance = 0.1)


# proportion of dataset used to train
propTrain = 0.75  

runs = 5
# run lda on training set multiple times
results = vector(length = runs)

for (i in c(1:runs)){
  
  train = train[sample(size), ]
  # form testing and training sets
  trainSet = trainC[1:(size*propTrain), -1]
  trainLabels = trainC[1:(size*propTrain), 1]
  testSet = trainC[(size*propTrain):size, -1]
  testLabels = trainC[(size*propTrain):size, 1]


  accuracy = runLDA(trainSet, testSet, trainLabels, testLabels)
  results[i] = accuracy
  cat("Run ", i, ": LDA classifier had ", 100*accuracy,"% accuracy.\n")
}

# format output
# finalprediction<- cbind(as.data.frame(1:nrow(predictions)),predictions)
# colnames(finalprediction) <- c("ImageId","Label")
# write to file
# write.csv(finalprediction,file="predictions.csv",row.names=FALSE)

