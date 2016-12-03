# MKinsey

# wrap generic function for MNIST digit data
printDigit = function(row, resolution=28) {
  return(printGenericImage(row, resolution, resolution))
}

# take 1D data frame and compose a x by y matrix, then call image function
printGenericImage = function(data, x, y) {
  d = matrix(nrow = x, ncol = y)
  
  for(i in 1:(x)){  # refactor to use apply?
    for(j in 1:(y)){
      d[i, j] = as.numeric(data[(i-1)*x + (j)])
    }
  }
  d = t(apply(d, 2, rev)) # reverse the columns in matrix, then transpose.
  return(image(d, col = grey(seq(0, 1, length=256)))) # use greyscale
}

