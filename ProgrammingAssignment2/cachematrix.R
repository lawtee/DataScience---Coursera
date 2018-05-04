## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#The first function, makeCacheMatric creates a special matrix, which is really a list containing a function to 
#1. set the value of the matrix
#2. get the value of the matrix
#3 set the value of the inversed matrix
#4 get the value of the inversed matrix

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  #set the matrix
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  #get the matrix
  get <- function() x
  #set the inversed matrix
  setinverse <- function(inverse) m <<- inverse
  #set the inversed matrix
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
#This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
      
      m <- x$getinverse()
      if(!is.null(m)) {
        #Cache data
        message("getting cached data")
        return(m) #return the cache data       
      }
      
      data <- x$get() #retreive previously stored data
      
      m <- solve(data, ...) #Solve the inverse matrix
      x$setinverse(m) #store the inverse matrix
      
      ## Return a matrix that is the inverse of 'x'
      m        
  
}

#Unit Test for Assignment Program 2
#Simplified Testing #1
# amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))
# amatrix$get()         # Returns original matrix
# cacheSolve(amatrix)   # Computes, caches, and returns    matrix inverse
# amatrix$getinverse()  # Returns matrix inverse
# cacheSolve(amatrix)   # Returns cached matrix inverse using previously computed matrix inverse

#Detailed Testing
#Reference: https://class.coursera.org/rprog-008/forum/thread?thread_id=174
# >    source("cachematrix.R")
# 
# >    amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))
# >    amatrix$get()         # Returns original matrix
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# 
# >   cacheSolve(amatrix)   # Computes, caches, and returns    matrix inverse
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
# 
# >  amatrix$getinverse()  # Returns matrix inverse
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
# 
# >  cacheSolve(amatrix)   # Returns cached matrix inverse using previously computed matrix inverse
# getting cached data
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
# 
# >    amatrix$set(matrix(c(0,5,99,66), nrow=2, ncol=2)) # Modify existing matrix
# >    cacheSolve(amatrix)   # Computes, caches, and returns new matrix inverse
# [,1] [,2]
# [1,] -0.13333333  0.2
# [2,]  0.01010101  0.0
# 
# >    amatrix$get()         # Returns matrix
# [,1] [,2]
# [1,]    0   99
# [2,]    5   66
# 
# >    amatrix$getinverse()  # Returns matrix inverse
# [,1] [,2]
# [1,] -0.13333333  0.2
# [2,]  0.01010101  0.0

