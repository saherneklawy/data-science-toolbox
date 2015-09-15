#' A function that simplifies installing packages
#'
#' A dummy function to test package creation
#' @param pacakge name
#' @param github repo name and user if installed using github directly
#' @keywords tools
#' @export
#' @examples
#' installIfNeeded("devtools")
#' installIfNeeded("roxygen2", "klutometis/roxygen")
install.if.needed <- function(pkg, github = NA) {
  # http://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them
  if(!all(c(pkg) %in% installed.packages()[,"Package"])) {
    if(is.na(github)) {
      install.packages(pkg, repos="http://cran.rstudio.com/", dependencies = TRUE)
    }
    else {
      devtools::install_github(github)
    }
  }
}
