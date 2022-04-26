## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}

# cacheSolve: This function computes the inverse of the special "matrix" returned by 
# makeCacheMatrix above.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		 mat_inv <- vec_mat$getinv()
  if(!is.null(mat_inv)) {
    message("getting cached data")
    return(mat_inv)
  }
  data <- vec_mat$get()
  mat_inv <- solve(data, ...)
  vec_mat$setinv(mat_inv)
  mat_inv
}
