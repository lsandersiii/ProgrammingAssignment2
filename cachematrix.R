# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(vec_mat = matrix()) {
  mat_inv <- NULL   # set value of inverse from cachesolve()function to vec_mat
  
  set <- function(y) {  # function to set parameter of makeCacheMatrix() function & reset vec_mat from cachesolve
    vec_mat <<- y
    mat_inv <<- NULL
  }
 
  get <- function() vec_mat
  setinv <- function(inv1) mat_inv <<- inv1   # assign value of inverse to vec_mat in the parent scope
  getinv <- function() mat_inv
  #list(set = set, get = get, setinv = setinv, getinv = getinv)
  list(set = set,           # gives the name 'set' to the set() function defined above
       get = get,           # gives the name 'get' to the get() function defined above
       setinv = setinv,     # gives the name 'setinv' to the setinv() function defined above
       getinv = getinv)     # gives the name 'getinv' to the getinv() function defined above
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
