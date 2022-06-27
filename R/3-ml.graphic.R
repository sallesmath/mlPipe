#' Plotting evaluation metrics from different machine learning models
#'
#' @import lattice
#' @param ml_result a list of trained machine learning models
#' @param graphic user-determined plotting options (bwplot, dotplot, splom or parallelplot)
#' @param ... your specific graphic params
#' @inheritParams lattice::splom
#' @inheritParams lattice::parallelplot
#' @inheritParams lattice::bwplot
#' @inheritParams lattice::dotplot
#'
#' @return graphic
#' @export
#'
#' @examples
#' # upload the necessary packages
#' library(mlbench)
#' library(caret)
#' library(caretEnsemble)
#' library(mlPipe)
#' # load data
#' # table available in caret package database
#' data(PimaIndiansDiabetes)
#' # rename dataset to keep code below generic
#' my_df <- PimaIndiansDiabetes
#' # now you're able to train your data
#' my_models <- ml.trainlist(my_df, 0.8, algorithm = c("rf", "lda", "glm", "knn"), metric = "Accuracy", seed = 42, resampling = "cv")
#' my_models
#' results <- caret::resamples(my_models)
#' summary(results)
#' ml.graphic(ml_result = results, graphic = "bwplot")

ml.graphic <- function(ml_result, graphic = c("bwplot", "dotplot", "parallelplot", "splom"), ...) {
  graphic <- match.arg(graphic)
  if(graphic=="bwplot") return(bwplot(ml_result))
  if(graphic=="dotplot") return(dotplot(ml_result))
  if(graphic=="parallelplot") return(parallelplot(ml_result))
  if(graphic=="splom") return(splom(ml_result))
}
