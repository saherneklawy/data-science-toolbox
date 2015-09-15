#' A testing function
#'
#' A dummy function to test package creation
#' @param test
#' @keywords  test
#' @export
#' @examples
#' foo_test()

foo_test <- function(test=FALSE){
    if(test==TRUE){
        print("I love cats!")
    }
    else {
        print("I am not a cool person.")
    }
}
