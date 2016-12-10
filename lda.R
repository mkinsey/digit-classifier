# Contains helper methods for running LDA. 
# Written to be generalizable for any reasonable data set

# MKinsey


# remove colinear columns 
# for LDA, column variance > given tolerance squared (default 1e-4)
removeColinear = function(df, tolerance=0.1){
  df = df[,apply(df, 2, function(col) {
    var(col) > tolerance
  })]
}

# remove constant columns 
# for LDA, column variance > given tolerance squared (default 1e-4)
removeConstant = function(df, n = 4){
  df = df[,apply(df, 2, function(col) {
    length(unique(col)) > n 
  })]
}

# execute LDA and find accuracy
runLDA = function(trainSet, testSet, trainLabels, testLabels){
  
  fit = lda(trainSet, trainLabels)
  
  # get missed predictions
  predictions = predict(fit, testSet)$class
  missed = which(predictions != testLabels)
  
  # find % accuracy
  testSize = size * (1-propTrain)
  return((testSize-length(missed))/testSize)
}