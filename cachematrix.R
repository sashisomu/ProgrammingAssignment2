## The First Function,makeCacheMatrix creates a special "Matrix" and cache its inverse
## And is really a list containing a function to
#1. set the matrix
#2. get the matrix
#3. set the inverse of matrix
#4. get the inverse of matrix
## Takes a invertible matrix as input

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function() {
        x
    }
    
    setsolve <- function(solve) {
        m <<- solve
    }
    getsolve <- function() {
        m
    }
    
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}

## Checks for inverse of the matrix in cache and returns it
## if inverse doesn't exist Calculates the inverse of the matrix and returns it 

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    m <- x$getsolve()
    
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    data <- x$get()
    m <- solve(data,...)
    x$setsolve(m)
    m
    
}
