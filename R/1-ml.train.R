#' Configuration of input file and training data with a machine learning model
#'
#' @import caret mlbench randomForest utils
#' @param train_sample your train set
#' @param resampling specific method from caret::trainControl
#' @param algorithm specific method from caret::trainControl
#' @param metric specific evaluation metric from caret::trainControl
#' @param seed specific seed value
#'
#' @return an object is returned of class train
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
#' # now we're going to define our training sample
#' my_training_sample <- ml.trainset(my_df, 0.8, seed = 42)
#' my_training_sample
#' # and now we're able to train our model
#' my_model <- ml.train(train_sample = my_training_sample, algorithm = "lda", metric = "Accuracy", seed = 42, resampling = "cv")
#' my_model

ml.train <- function(train_sample, algorithm, metric, seed, resampling) {
  set.seed(seed) # setting a specific seed

  dependent_variable <- train_sample[ , ncol(train_sample), drop = FALSE] # here we're setting our dependent variable, assuming it's in the last column of your dataframe
  vec_dependent_variable <- dependent_variable[, 1] # transforming our dependent variable into a vector
  final_train_sample <- train_sample[,-ncol(train_sample)] # here we're removing the column with the dependent variable from our new dataframe with the training data

  control <- caret::trainControl(method = resampling) # setting parameters from trainControl
  model.fit <- caret::train(final_train_sample, vec_dependent_variable, method=algorithm, metric=metric, trControl=control)
  return(model.fit)
}
