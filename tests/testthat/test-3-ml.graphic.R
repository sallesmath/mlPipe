test_that("test if your desired list of plots is working", {
  # load data
  # table available in caret package database
  library(mlbench)
  data(PimaIndiansDiabetes)
  # rename dataset to keep code below generic
  my_df <- PimaIndiansDiabetes
  # now you're able to train your data
  my_models <- ml.trainlist(my_df, 0.8, algorithm = c("rf", "lda", "glm", "knn"), metric = "Accuracy", seed = 42, resampling = "repeatedcv")
  my_models
  results <- caret::resamples(my_models)
  summary(results)
  my_plot <- ml.graphic(ml_result = results, graphic = "bwplot")
  expect_type(my_plot, "list")
})
