evaluation.utils.data_frame.sample <- NULL


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
  if(is.null(evaluation.utils.data_frame.sample)) {
    evaluation.utils.data_frame.sample <<- split_data(data_frame, sample_ratio, seed)
  }
  func(evaluation.utils.data_frame.sample)
}



#' A function that splits the data to training and test
#'
#' A dummy function to test package creation
#' @param data_frame
#' @param training_ratio the sample to take out of the data
#' @param seed the seed for the sample
#' @keywords  partitioning data
#' @export
#' @examples
#' split_data(data_frame)$train
#' split_data(data_frame)$test
split_data <- function(data_frame, training_ratio = 0.6, seed = 12239) {
  set.seed(seed)
  N = nrow(data_frame)
  data_frame$original_index = 1:N
  indexes = sample(N, as.integer(N*training_ratio))
  train = data_frame[ indexes, ]
  test = data_frame[ -indexes, ]
  list(train = train, test = test)
}
