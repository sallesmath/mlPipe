#' Configuration of input file and training data with a machine learning model
#'
#' @import caret mlbench
#' @param dataset a dataframe
#' @param train_percent numerical value (percentage, in decimals) you want for training data
#' @param resampling specific method from caret::trainControl
#' @param algorithm specific method from caret::trainControl
#' @param metric specific evaluation metric from caret::trainControl
#' @param seed specific seed value
#' @inheritParams caret::trainControl
#' @inheritParams caret::train
#'
#' @return a list is returned of class train
#' @export
#'
#' @examples
#' # upload the necessary packages
#' library(mlbench)
#' library(caret)
#' # load data
#' # table available in caret package database
#' data(PimaIndiansDiabetes)
#' # rename dataset to keep code below generic
#' my_df <- PimaIndiansDiabetes
#' # now you're able to train your data
#' my_model <- ml.train(my_df, 0.8, "repeatedcv", "lda", "Accuracy", 42)
#' my_model

ml.train <- function(dataset, train_percent, resampling, algorithm, metric, seed) {
  set.seed(seed) # setting a specific seed
  rows <- sample(nrow(dataset))
  shuffled_dataset <- dataset[rows, ] # here we're shuffling our data, to avoid any bias in the analysis
  split <- round(nrow(shuffled_dataset) * train_percent) # setting a training sample from the original dataframe
  first_train_sample <- shuffled_dataset[1:split, ] # here we're setting our training sample
  dependent_variable <- first_train_sample[ , ncol(first_train_sample), drop = FALSE] # here we're setting our dependent variable, assuming it's in the last column of the dataframe
  vec_dependent_variable <- dependent_variable[, 1] # transforming our dependent variable into a vector
  final_train_sample <- first_train_sample[,-ncol(first_train_sample)] # here we're removing the column with the dependent variable from our new dataframe with the training data
  control <- caret::trainControl(method = resampling) # setting parameters from trainControl
  model.fit <- caret::train(final_train_sample, vec_dependent_variable, method=algorithm, metric=metric, trControl=control)
  return(model.fit)
}
