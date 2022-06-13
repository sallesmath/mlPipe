#' Returning a list from multiple machine learning trained models
#'
#' @import caret mlbench caretEnsemble
#' @param dataset a dataframe
#' @param train_percent numerical value (percentage, in decimals) you want for training data
#' @param algorithm set of methods from caret::trainControl
#' @param metric specific evaluation metric from caret::trainControl
#' @param seed specific seed value
#' @param resampling specific method from caret::trainControl
#' @inheritParams caret::trainControl
#' @inheritParams caret::train
#' @inheritParams caretEnsemble::caretList
#'
#' @return a list of objects of class 'train' (from caret::train)
#' @export
#'
#' @examples
#' # upload the necessary packages
#' library(mlbench)
#' library(caret)
#' library(caretEnsemble)
#' # load data
#' # table available in caret package database
#' data(PimaIndiansDiabetes)
#' # rename dataset to keep code below generic
#' my_df <- PimaIndiansDiabetes
#' # now you're able to train your data
#' ml.trainlist(my_df, 0.8, algorithm = c("rf", "lda", "glm", "knn"), metric = "Accuracy", seed = 42, resampling = "cv")
#' my_model

ml.trainlist <- function(dataset, train_percent, algorithm, metric, seed, resampling) {
  set.seed(seed) # setting a specific seed
  rows <- sample(nrow(dataset))

  shuffled_dataset <- dataset[rows, ] # here we're shuffling our data, to avoid any bias in the analysis
  split <- round(nrow(shuffled_dataset) * train_percent) # setting a training sample from the original dataframe
  first_train_sample <- shuffled_dataset[1:split, ] # here we're setting our training sample

  dependent_variable <- first_train_sample[ , ncol(first_train_sample), drop = FALSE] # here we're setting our dependent variable, assuming it's in the last column of the dataframe
  vec_dependent_variable <- dependent_variable[, 1] # transforming our dependent variable into a vector
  final_train_sample <- first_train_sample[,-ncol(first_train_sample)] # here we're removing the column with the dependent variable from our new dataframe with the training data

  control <- caret::trainControl(method = resampling) # setting parameters from trainControl

  # now we're going to create a list of several train models from the caret package, by building a list of train objects suitable for ensembling using the caretEnsemble function
  list_caret <- caretEnsemble::caretList(final_train_sample, vec_dependent_variable, methodList = algorithm, metric = metric, trControl = control)

  return(list_caret) # return your caretList
}
