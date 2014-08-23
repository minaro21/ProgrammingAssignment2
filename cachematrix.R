## creates a matrix that can have its inverse cached

## associates functions with matrix and makes cache for its inverse
makeCacheMatrix <- function(x = matrix()) {
        inverse_Matrix <- NULL
        get <- function() {
                x
        }
        set_inverse <- function(inverse) {
                inverse_Matrix <<- inverse
        }
        get_inverse <- function() {
                inverse_Matrix
        } 
        list(get = get,
             set_inverse = set_inverse,
             get_inverse = get_inverse)
}

## searches for cached value. if none, will calculate matrix inverse and cache it. 
cachesolve <- function(x, ...) {
        inv <- x$get_inverse()
        if(!is.null(inv)) {
                message("cached data")
                return (inv)
        }
        data <- x$get()
        cache <- solve(data, ...)
        x$set_inverse(cache)
        cache
}