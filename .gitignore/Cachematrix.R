## Put comments here that give an overall description of what your
## functions do
## Write a short comment describing this function
##This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {## define the argument with default mode of "matrix"
  m <- NULL ## initialize m as NULL; will hold value of matrix inverse 
  set <- function(y) {## define the set function to assign new value of matrix in parent environment
    x <<- y
    m <<- NULL ## if there is a new matrix, reset m to NULL
  }
  get <- function() x   ## define the get fucntion - returns value of the matrix argument
  setmean <- function(mean) m <<- mean   ## gets the value of m where called
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
  
}


## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then cacheSolve will retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}