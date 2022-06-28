#' Setting a training sample to machine learning analyses
#'
#' @param dataset a dataframe
#' @param train_percent numerical value (percentage, in decimals) you want for training data
#' @param seed specific seed value
#'
#' @return a new dataframe, now only with our training sample
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
#' # rename dataset to keep code below generic
#' my_df <- PimaIndiansDiabetes
#' # now you're able to define your training sample
#' my_training_sample <- ml.trainset(my_df, 0.8, seed = 42)
#' my_training_sample

ml.trainset <- function(dataset, train_percent, seed) {
  set.seed(seed) # setting a specific seed

  rows <- sample(nrow(dataset)) # sampling rows from your dataset

  shuffled_dataset <- dataset[rows, ] # here we're shuffling our data, to avoid any bias in the analysis

  split_train <- round(nrow(shuffled_dataset) * train_percent) # setting a training sample from the original dataframe

  first_train_sample <- shuffled_dataset[1:split_train, ] # here we're defining our training sample

  return(first_train_sample)
}
