#' Setting a test sample to machine learning analyses
#'
#' @param dataset a dataframe
#' @param test_percent numerical value (percentage, in decimals) you want for test data
#' @param seed specific seed value
#'
#' @return a new dataframe, now only with our test sample
#' @export
#'
#' @examples
#' # load packages
#' library(mlbench)
#' library(caret)
#' library(mlPipe)
#' # load data
#' # table available in caret package database
#' data(PimaIndiansDiabetes)
#' my_df <- PimaIndiansDiabetes
#' # rename dataset to keep code below generic
#' my_df <- PimaIndiansDiabetes
#' # now you're able to define your training sample
#' my_test_sample <- ml.testset(my_df, 0.2, seed = 42)
#' my_test_sample
ml.testset <- function(dataset, test_percent, seed) {
  set.seed(seed) # setting a specific seed. This should be the same seed used to define the training sample

  rows <- sample(nrow(dataset)) # sampling rows from your dataset

  shuffled_dataset <- dataset[rows, ] # here we're shuffling our data, to avoid any bias in the analysis

  split_test <- round(nrow(shuffled_dataset) * test_percent) # setting a test sample from the original dataframe

  test_sample <- tail(shuffled_dataset, n = split_test) # here we're defining our test sample

  return(test_sample)
}
