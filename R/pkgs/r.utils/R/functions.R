#' A function that simplifies installing packages
#'
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


#' A function that auto adjusts the r terminal columns width
#' from: http://stackoverflow.com/questions/1172485/how-to-increase-the-number-of-columns-using-r-in-linux
#'
#' @keywords tools
#' @export
#' @examples
#' wideScreen()
wideScreen <- function(howWide=as.numeric(strsplit(system('stty size', intern=T), ' ')[[1]])[2]) {
   options(width=as.integer(howWide))
}
