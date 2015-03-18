## Below functions can be used to create a special object that calculates and cache's matrix mean.


#Function makeCacheMatrix creates a special "vector", which is really a list allolwing to:
#set the value of the matrix
#get the value of the matrix
#set the value of the inverse of matrix
#get the value of the inverse of matrix


makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) i <<- solve
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The following function calculates the inverse of the special "matrix" created with the above function. However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setinverse function.

'Warning! The matrix has to be invertible, otherwise the function won''t work.'

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}

#Example of use:
example<-matrix(c(2,2,3,2),nrow=2)
example_cached<-makeCacheMatrix(example)
#the first time function is called it calculates the inverse
inversed_example<-cacheSolve(example_cached)
inversed_example
#the second time, it uses previously cached inverse
inversed_example<-cacheSolve(example_cached)
