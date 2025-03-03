##
##
## Basically, the following functions, are part of the assignment 
## of "caching the inverse of a matrix". I followed the example
## ("Caching the Mean of a Vector"), which was clear, on how to do the same in this assignment.
## 
## The function ***makeCacheMatrix*** creates a special "matrix" object that can cache its inverse.
##
makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      set <- function(y) {
        x <<- y
        inv <<- NULL
      }
      get <- function() x
      setInverse <- function(Inverse) inv <<- Inverse
      getInverse <- function() inv
      list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}
##
##
## The function ***cacheSolve*** computes the inverse of the special "matrix" returned
## by ***makeCacheMatrix*** above.
#
cacheSolve <- function(x, ...) {
      inv <- x$getInverse()
      if(!is.null(inv)) {
        message("cached data")
        return(inv)
      }
      ma <- x$get()
      inv <- solve(ma, ...)
      x$setInverse(inv)
      inv
}
