## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## X is a square invertible matrix
## returns a list containing functions to
##              1. set the matrix
##              2. get the matrix
##              3. set the inverse
##              4. get the inverse
## The list is then used in the cacheSolve function

makeCacheMatrix <- function(x = matrix()) {
  inv = NULL
  set = function(y) {
    x <<- y
    inv = NULL
  }
get = function() x
setinv = function(inverse) inv <<- inverse
getinv = function() inv
list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Write a short comment describing this function
## Test if the inverse has already been calculated, if it has, return data from cache
## otherwise calculate and return the inverse of the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv = x$getinv()
  
  if (!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  
  mat.data = x$get()
  inv = solve(mat.data, ...)
  
  x$setinv(inv)
  
  return(inv)
}
