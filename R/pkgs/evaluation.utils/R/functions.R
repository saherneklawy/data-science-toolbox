#' A function that takes a data source, and runs a function on a sample of the data
#'
#' A dummy function to test package creation
#' @param data_frame
#' @param function the function to run on the sampled data frame
#' @param sample_ratio the sample to take out of the data
#' @param seed the seed for the sample
#' @keywords  evaluation
#' @export
#' @examples
#' run_on_sample(data_frame, str)
run_on_sample <- function(data_frame,
                          func,
                          sample_ratio = 0.6,
                          seed = 12239) {
  set.seed(seed)
  data_frame.sample = sample(data_frame, as.int(nrow(data_frame)*sample))
  func(data_frame.sample)
}
