#' Returning a list from multiple machine learning trained models
#'
#' @import caret mlbench caretEnsemble randomForest
#' @param dataset a dataframe
#' @param train_percent numerical value (percentage, in decimals) you want for training data
#' @param algorithm set of methods from caret::trainControl
#' @param metric specific evaluation metric from caret::trainControl
#' @param seed specific seed value
#' @param resampling specific method from caret::trainControl
#' @param ... another parameters from your choice
#' @inheritParams caret::trainControl
#' @inheritParams caretEnsemble::caretList
#'
#' @return a list of objects of class 'train' (from caret::train)
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
#' my_training_sample <- ml.train(my_df, 0.8, seed = 42)
#' my_training_sample
#' # and now we're able to train our model
#' my_models <- ml.trainlist(train_sample = my_training_sample, algorithm = c("rf", "lda", "glm", "knn"), metric = "Accuracy", seed = 42, resampling = "cv")
#' my_models

ml.trainlist <- function(train_sample, algorithm, metric, seed, resampling, ...) {
  set.seed(seed) # setting a specific seed

  dependent_variable <- train_sample[ , ncol(train_sample), drop = FALSE] # here we're setting our dependent variable, assuming it's in the last column of your dataframe
  vec_dependent_variable <- dependent_variable[, 1] # transforming our dependent variable into a vector
  final_train_sample <- train_sample[,-ncol(train_sample)] # here we're removing the column with the dependent variable from our new dataframe with the training data

  control <- caret::trainControl(method = resampling) # setting parameters from trainControl

  # now we're going to create a list of several train models from the caret package, by building a list of train objects suitable for ensembling using the caretEnsemble function
  list_caret <- caretEnsemble::caretList(final_train_sample, vec_dependent_variable, methodList = algorithm, metric = metric, trControl = control)

  return(list_caret) # return your caretList
}
