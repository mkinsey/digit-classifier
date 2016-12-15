# MKinsey
# Digit Classification using KNN

library(class)

train <- read.csv("train.csv")
test  <- read.csv("test.csv")

trainSet = train[, -1]
trainLabels = train[, 1]

# KNN
# PCA using SVD
dPca = prcomp(trainSet)

# columns are eigenvectors, use first 150 principal components
trainPca = as.matrix(trainSet) %*% dPca$rotation[ , 1:150]  
testPca = as.matrix(test) %*% dPca$rotation[ , 1:150]
fitPca = knn(trainPca, testPca, trainLabels)

# format output
finalprediction<- cbind(as.data.frame(1:length(fitPca)),fitPca)
colnames(finalprediction) <- c("ImageId","Label")
# write to file
write.csv(finalprediction,file="predictions.csv",row.names=FALSE)
