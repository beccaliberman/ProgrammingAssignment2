# This function returns a special matrix object.  This object is not technically a matrix.
# The object lets you set the matrix, access the matrix, and set it's inverse.

    makeCacheMatrix <- function(x = matrix()) {
      im <- NULL
      set <- function(y) {
      x <<- y
      im <<- NULL
  }
     get <- function() x
    setinverse <- function(matrix) im <<- matrix
    getinverse <- function() im
    list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

# This function grabs the stored matrix object, calculates the inverse if necessary, caches, and returns it. 
# The caching part is important, as the function will return the cached value, saving computing effort.
    cacheSolve <- function(x, ...) {
    im <- x$getinverse()
    if(!is.null(im)) {
    message("getting cached data")
    return(im)
  }
    data <- x$get()
    im <- solve(data, ...)
    x$setinverse(im)
    im
}