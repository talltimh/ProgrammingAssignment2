## one of the community TAs commented in the forum with a link to test matrix calculations
## online at www.bluebit.gr/matrix-calculator/ - the thread was titled "Test cases Please!"

## a very helpful resource in addition to to community forum was the course wiki
## https://share.coursera.org/wiki/index.php/DataSciSpec:Useful_Resources

## computing the inverse of a square matrix is accomplished with the solve function in R


## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    invmatrix <- NULL
    set <- function(y) {
        x <<- y
        invmatrix <<- NULL
    }
    ## get value
    get <- function() x
    ## set inverse
    setinverse <- function(solve) invmatrix <<- solve
    getinverse <- function() invmatrix
    ## list to get the inverse of the matrix
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    ## performs the inv return operation
    if(!is.null(inv)) {
        message("pull cached data:")
        return(inv)
    }
    data <- x$get()
    ## use the solve function
    inv <- solve(data)
    x$setinverse(inv)
    ## print
    inv
}

