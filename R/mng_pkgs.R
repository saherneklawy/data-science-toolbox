#options(echo=TRUE) # if you want see commands in output file
args <- commandArgs(trailingOnly = TRUE)

installIfNeeded <- function(pkg, github = NA) {
  # http://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them
  if(!all(c(pkg) %in% installed.packages()[,"Package"])) {
    if(is.na(github)) {
      install.packages(pkg, repos="http://cran.rstudio.com/")
    }
    else {
      devtools::install_github(github)
    }
  }
}

apply_on_packages <- function(func) {
  dirs <- list.dirs(recursive=F)
  dirs <- dirs[dirs!="."]
  pkg_names <- gsub("./", "", dirs)
  sapply(pkg_names, func)
}

command = args[1]
packageName = args[2]

installIfNeeded("devtools")
installIfNeeded("roxygen2", "klutometis/roxygen")

library("devtools")
library(roxygen2)

setwd("pkgs")

#http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/
if(!is.na(command) && command == 'create') {
  create(packageName)
} else if(!is.na(command) && command == 'build') {
  setwd(packageName)
  document()
} else if(!is.na(command) && command == 'build-all') {
  apply_on_packages(function(pkg_name) {setwd(pkg_name); document(); setwd("..")})
} else if(!is.na(command) && command == 'install') {
  install(packageName)
} else if(!is.na(command) && command == 'install-all') {
  apply_on_packages(install)
} else {
  cat("Usage 1: Rscript mng_pkgs.R (create|build|install) <PackageName>\n")
  cat("Usage 2: Rscript mng_pkgs.R (build-all|install-all)\n")
}
