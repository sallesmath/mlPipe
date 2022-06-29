test_that("test if your desired list of plots is working", {
  # load data
  # table available in caret package database
  library(mlbench)
  data(PimaIndiansDiabetes)
  # rename dataset to keep code below generic
  my_df <- PimaIndiansDiabetes
  # now we're going to define our train set
  my_training_sample <- ml.trainset(my_df, 0.8, seed = 42)
  # and now we're able to train our data
  my_models <- ml.trainlist(train_sample = my_training_sample, algorithm = c("rf", "lda", "glm", "knn"), metric = "Accuracy", seed = 42, resampling = "cv")
  my_models
  results <- caret::resamples(my_models)
  summary(results)
  my_plot <- ml.graphic(ml_result = results, graphic = "bwplot")
  expect_type(my_plot, "list")
})
