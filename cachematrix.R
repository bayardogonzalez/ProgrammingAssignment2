## We are caching the inverse of the function because it is faster to do this than to run it every time 
## especially if there is a lot of data.  Therefore we are doing it in this environment. 

makeCacheMatrix <- function(x = matrix()) {
 inv <- NULL
  set <- function(y) 
    {
    x <<- y
    inv <<- NULL    
  }
  
   }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Sine we have already defined the inverse of the matrix within the previous function we can solve for it
## with the next function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}
