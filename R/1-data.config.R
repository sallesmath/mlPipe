#' Configuration of input files
#'
#' @import caret mlbench
#' @param dataset a dataframe
#' @param train_percent numerical value (percentage, in decimals) you want for training data
#' @param resampling specific method from caret::trainControl
#'
#' @return
#' @export
#'
#' @examples
#' # upload the necessary packages
#' install.packages("mlbench")
#' library(mlbench)
#' install.packages("caret")
#' library(caret)
#' # load data
#' # table available in caret package database
#' data(PimaIndiansDiabetes)
#' # rename dataset to keep code below generic
#' my_df <- PimaIndiansDiabetes
#' my_df_config <- data.config(my_df, 0.7, "repeatedcv")
#' my_df_config
data.config <- function(dataset, train_percent, resampling) {
  new_sample <- sample(1:length(dataset[,1]), length(dataset[,1])*train_percent)
  train_sample = dataset[new_sample,]
  control <- trainControl(method = resampling)
  return(control)
}
